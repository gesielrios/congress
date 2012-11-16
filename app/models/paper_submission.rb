class PaperSubmission < ActiveRecord::Base
  attr_accessible :email, :name, :title, :token, :paper, :status_id
  belongs_to :status
  
  has_attached_file :paper, :storage => :Dropboxstorage,
                    :path => "/:attachment/:id/:style/:filename"
  
  validates_presence_of :email, :title, :name
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  validates_uniqueness_of :token, :title
  validate :attachment_content_type, :deadline
  
  after_validation :generate_token, :add_status, :on => :create
  
  #Paperclip Custon Validations
  VALID_CONTENT_TYPES = ["application/zip", "application/x-zip", "application/x-zip-compressed", "application/pdf", "application/x-pdf"]
  
  before_validation(:on => :create) do |file|
    if file.paper_content_type == 'application/octet-stream'
      mime_type = MIME::Types.type_for(file.media_file_name)    
      file.paper_content_type = mime_type.first.content_type if mime_type.first
    end
  end
  
  self.per_page = 10
  
  def deadline
    errors.add(:created_at, "Fora do prazo de envio do resumo.") unless Date.today < Date.new(2012,11,16)
  end

  def attachment_content_type
    errors.add(:paper, "formato invalido") unless VALID_CONTENT_TYPES.include?(self.paper_content_type)
  end
   
  def generate_token
    self.token = Digest::MD5.hexdigest("#{self.name}-#{self.title}-#{self.email}")
  end
  
  def add_status
    self.status_id = Status.find_by_description("Em analise")
  end
   
end

class Contact < ActiveRecord::Base
  attr_accessible :email, :menssage, :name, :subject
  
  validates_presence_of :email, :menssage, :name, :subject
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  
end

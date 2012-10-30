class Status < ActiveRecord::Base
  attr_accessible :description
  has_many :paper_submissions
  validates :description, :presence => true, :uniqueness => true
  
end

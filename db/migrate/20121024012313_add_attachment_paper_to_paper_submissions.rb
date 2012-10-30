class AddAttachmentPaperToPaperSubmissions < ActiveRecord::Migration
  def self.up
    change_table :paper_submissions do |t|
      t.has_attached_file :paper
    end
  end

  def self.down
    drop_attached_file :paper_submissions, :paper
  end
end

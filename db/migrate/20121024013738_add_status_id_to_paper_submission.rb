class AddStatusIdToPaperSubmission < ActiveRecord::Migration
  def change
    add_column :paper_submissions, :status_id, :integer
  end
end

class AddTokenToPaperSubmission < ActiveRecord::Migration
  def change
    add_column :paper_submissions, :token, :string
  end
end

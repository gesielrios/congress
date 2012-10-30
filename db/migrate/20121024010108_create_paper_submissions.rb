class CreatePaperSubmissions < ActiveRecord::Migration
  def change
    create_table :paper_submissions do |t|
      t.string :name
      t.string :email
      t.string :title

      t.timestamps
    end
  end
end

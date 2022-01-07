class AddFileToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :file, :string
  end
end

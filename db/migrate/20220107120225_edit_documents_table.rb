class EditDocumentsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :documents , :location
  end
end

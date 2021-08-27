class RenameColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :type, :book_type
  end
end

class CreateAuthorsAndSections < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string 'title'
      t.integer 'author_id'
      t.string 'type'
      t.integer 'year'
      t.timestamps
    end

    create_table :authors do |t|
      t.string 'name'
      t.timestamps
    end

    create_table :sections do |t|
      t.integer 'book_id'
      t.string 'title'
      t.timestamps
    end

  end
end

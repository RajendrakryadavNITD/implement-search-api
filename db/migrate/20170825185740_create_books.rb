class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.text :short_description
      t.text :long_description
      t.integer :chapter_index
      t.date :date_of_publication

      t.timestamps null: false
    end
  end
end

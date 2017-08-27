class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.text :author_bio
      t.string :profile_pic
      t.text :academics
      t.text :awards

      t.timestamps null: false
    end
  end
end

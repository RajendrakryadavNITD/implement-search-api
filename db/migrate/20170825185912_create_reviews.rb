class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.integer :rating
      t.text :review_title
      t.text :review_description
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

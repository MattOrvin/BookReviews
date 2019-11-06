class CreateBookReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :book_reviews do |t|
      t.string :text
      t.integer :rating
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :rating
      t.integer :user_id
      t.references :restaurant, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :restaurants
  end
end

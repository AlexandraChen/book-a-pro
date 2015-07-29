class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.text :description
      t.integer :user_id
      t.integer :professional_id
      
      t.timestamps null: false
    end
  end
end

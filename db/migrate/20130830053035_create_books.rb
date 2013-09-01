class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :college_id
      t.integer :department
      t.integer :course_num
      t.string :title
      t.string :author
      t.string :isbn
      t.string :condition
      t.decimal :listing_price
      t.decimal :asking_price
      t.string :details

      t.timestamps
    end
  end
end

class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :college_id
      t.string :department
      t.integer :course_num
      t.string :title
      t.string :isbn
      t.string :author
      t.string :condition
      t.decimal :listing_price
      t.decimal :asking_price
      t.string :trade
      t.string :details
      t.datetime :expiration, default: Time.at_midnight(Time.now + 1814400)

      t.timestamps
    end
  end
end

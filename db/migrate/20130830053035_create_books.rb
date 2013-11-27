class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :school_id
      t.string :department
      t.integer :course_num
      t.string :title
      t.string :isbn
      t.string :author
      t.string :condition
      t.decimal :asking_price
      t.string :trade, default: ""
      t.string :details, default: ""
      t.string :contact
      t.datetime :expiration, default: (Time.now + 1209600).end_of_day

      t.timestamps
    end
  end
end

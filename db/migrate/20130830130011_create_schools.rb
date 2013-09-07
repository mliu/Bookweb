class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.integer :transaction_count
      t.string :name

      t.timestamps
    end
  end
end

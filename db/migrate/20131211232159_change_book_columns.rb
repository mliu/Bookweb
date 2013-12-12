class ChangeBookColumns < ActiveRecord::Migration
  def self.up
    change_column :books, :asking_price, :decimal, precision: 5, scale: 2
  end
end

class AddIsSellerToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :is_seller, :integer
  end

  def self.down
    drop_column :users, :is_seller
  end
end

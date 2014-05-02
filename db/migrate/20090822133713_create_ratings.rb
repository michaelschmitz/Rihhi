class CreateRatings < ActiveRecord::Migration
  def self.up
    create_table :ratings do |t|
      t.integer :order_id
      t.integer :user_id
      
      t.integer :seller_id
      t.integer :sellerrating
      t.integer :userrating
      t.string :sellertext
      t.string :usertext
      
      t.integer :dispute
      t.integer :user_has_rated, :default => false
      t.integer :seller_has_rated, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :ratings
  end
end

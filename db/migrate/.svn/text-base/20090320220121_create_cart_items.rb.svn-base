class CreateCartItems < ActiveRecord::Migration
  def self.up
    create_table :cart_items do |t|
      t.integer :listing_id
      t.integer :cart_id
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :amount
      t.string  :size
      t.string  :color
      t.timestamps
    end
  end

  def self.down
    drop_table :cart_items
  end
end

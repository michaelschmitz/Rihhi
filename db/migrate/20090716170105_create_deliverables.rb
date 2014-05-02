class CreateDeliverables < ActiveRecord::Migration
  def self.up
    create_table :deliverables do |t|
      t.integer :listing_id
      t.integer :order_id
      t.integer :amount
      
      #all information from the listing. this includes copying the pictures. Also add info to the deliverable model - has one album!
      t.string  :title
      t.text    :description
      t.decimal  :price, :precision => 8, :scale => 2    
      t.string  :color
      t.string  :size
      
      t.integer :category_id
      t.integer :subcategory_id
      t.integer :lastcategory_id
      t.string  :material_tag
      t.string  :public_tag
      t.string  :item_height
      t.string  :item_width
      t.string  :item_length
      t.string  :item_weight
      t.string  :safe_for_larp
      t.string  :safe_for_reenactment
      t.string :preparation_time
      t.string :country1
      t.string :country2
      t.string :country3
      t.string :country4
      t.string :country5
      t.decimal :country1_shipping, :precision => 8, :scale => 2
      t.decimal :country2_shipping, :precision => 8, :scale => 2
      t.decimal :country3_shipping, :precision => 8, :scale => 2
      t.decimal :country4_shipping, :precision => 8, :scale => 2
      t.decimal :country5_shipping, :precision => 8, :scale => 2
      t.decimal :country1_shipping_with_another_item, :precision => 8, :scale => 2
      t.decimal :country2_shipping_with_another_item, :precision => 8, :scale => 2
      t.decimal :country3_shipping_with_another_item, :precision => 8, :scale => 2
      t.decimal :country4_shipping_with_another_item, :precision => 8, :scale => 2
      t.decimal :country5_shipping_with_another_item, :precision => 8, :scale => 2
      t.string :country1_deliverytime
      t.string :country2_deliverytime
      t.string :country3_deliverytime
      t.string :country4_deliverytime        
      t.string :country5_deliverytime

      t.timestamps
    end
  end

  def self.down
    drop_table :deliverables
  end
end

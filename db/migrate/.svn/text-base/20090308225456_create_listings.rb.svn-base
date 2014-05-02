class CreateListings < ActiveRecord::Migration
  def self.up
    create_table :listings do |t|
      t.integer :seller_id
      t.string :title
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.string :sellerspecific_id #If the seller is a bigger company and already has an internal book-keeping system.
      t.string :category_tag
      #Linkage to category entries
      t.integer :category_id
      t.integer :subcategory_id
      t.integer :lastcategory_id
      t.integer :v #How often has this page been shown (Show page only)
      t.string :material_tag
      t.string :public_tag
      t.string :item_height
      t.string :item_width
      t.string :item_length
      t.string :item_weight
      t.string :item_circumference
      t.string :item_material_thickness
      t.string :country1
      t.string :country2
      t.string :country3
      t.string :country4
      t.string :country5
      t.string :preparation_time
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
      t.string :quality                   #"New", "Used, as new", "Visible signs of use"
      t.text   :shipping_comments
      t.string :safe_for_larp
      t.string :safe_for_reenactment
      t.string :percent_of_vat_included

      #Mark as inappropriate - this needs to move into its own talbble. One listing has-_many flags, one flag has one listing. So flag has the parent-id. remove this.
      t.string :flagged_status            #flagged, closed, removed
      t.string :removed_reason            #If admin removed item, reason should be stated.
      t.string :removed                   #Has the user or an admin removed the item? Then its not visible anymore anywhere. Removed = 1
      #Which step of the creation process is this item in? 
      t.string :complete                  #Nil or complete    -no d at the end of complete
      
      #Additional flag to make sure that items wthat are editet (which change from complete, above) do not show up again in the item creation process.
      t.string :creation                  #Either null or completed     -- note the d at the end.
      
      
      
      t.string :suggested_complements       #Not used yet
      t.string :favorited_number            #Not used yet
      t.string :hearted_number              #Not used yet
      t.integer :nr_of_items_in_stock, :default => "1"
      t.string :autoset_items_to_one, :default => "No"#this allows automatic re-listing of the item if sold succesfully and nr of items = 0
      t.timestamps
    end
  end

  def self.down
    drop_table :listings
  end
end

class CreateListingsLists < ActiveRecord::Migration
  def self.up
    create_table :listings_lists do |t| #Can this be deleted as we have lists_listings? Stefan can check. Not important right now.
      t.integer :list_id
      t.integer :listing_id
      t.text :comment
    end
  end

  def self.down
    drop_table :listings_lists
  end
end

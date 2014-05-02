class CreateListListing < ActiveRecord::Migration
  def self.up
    create_table :lists_listings do |t|
      t.integer :list_id
      t.integer :listing_id
      t.text :comment
    end
  end

  def self.down
    drop_table :lists_listings
  end
end

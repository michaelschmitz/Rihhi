class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      #Events & Ticket search
      t.string :title
      t.string :event_name
      t.date    :startdate
      t.date    :enddate
      t.string :country
      t.string :orga
      t.integer :min_age
      t.string :genre
      t.string :accomodation
      t.string :catering
      t.string :status
      t.string :rules
#     t.string :seller (Included at Listings)
      #Listings search
      t.string :category_id
      t.string :subcategory_id
      t.string :lastcategory_id
#     t.string :status (Included at Events)
      t.string :name
      t.string :seller
      t.string :min_price
      t.string :max_price
#     t.string :materials (Included as material_tags)
      t.string :description
      #Requests search
      t.string :requester
      t.date   :deadline
      t.string :material_tags
      t.string :other_tags
      t.string :request_status
      t.timestamps
    end
  end

  def self.down
    drop_table :searches
  end
end

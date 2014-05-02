class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :event_id
      t.integer :seller_id
      t.string :name
      t.date :valid_from
      t.date :valid_until
      t.text :description
      t.decimal :price1
      t.decimal :price2
      t.decimal :price3
      t.decimal :price4
      t.decimal :price5
      t.date :price1_deadline
      t.date :price2_deadline
      t.date :price3_deadline
      t.date :price4_deadline
      t.date :price5_deadline
      t.integer :nr_of_tickets_available_online
      t.string  :sc_or_nsc          
      t.integer :nr_of_tickets_sold
      t.integer :has_deal
      t.integer :deal_pickup_at_event
      t.integer :is_shipped
      t.decimal :shipping_cost_domestic
      t.decimal :shipping_cost_abroad
      t.integer :ticket_available_on_rihhi
      t.string :position            #In which position shall this ticket be shown (1 to N) on the listing pages ? 
      
      t.boolean :ticket_fullservice

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end

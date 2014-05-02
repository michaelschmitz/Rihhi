class CreateOrders < ActiveRecord::Migration
 
  def self.up
    create_table :orders do |t|
      t.string :seller_id
      t.string :user_id
      t.string :step          #At which step in the cart/ordering process? Step 2 is new.html, Step3 is new2.html (click to buy)

      t.string   :status        #"ordered", "payment_arrived", "shipped", "buyerfeedback received",...
      t.datetime :date_payment_arrived
      t.datetime :date_shipped
      t.datetime :date_buyerfeedback_received
      t.datetime :date_sellerfeedback_received
      t.datetime :date_closed
      t.text   :cancel_reason
      
      t.string    :number_of_deliverables
      t.decimal   :price_of_all_deliverables, :precision => 8, :scale => 2
      t.decimal   :cost_of_shipping, :precision => 8, :scale => 2
      t.decimal   :total_cost_of_order, :precision => 8, :scale => 2
      t.integer   :highest_preparation_time
      
      t.string :user_fullname
      t.string :user_address
      t.string :user_areacode
      t.string :user_city
      t.string :user_country
      t.string :payment_chosen
      
      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end

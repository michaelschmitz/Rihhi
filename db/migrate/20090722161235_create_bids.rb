class CreateBids < ActiveRecord::Migration
  def self.up
    create_table :bids do |t|
      t.integer :seller_id
      t.decimal :final_cost, :precision => 8, :scale => 2
      t.string  :preparation_time
      t.string :bid_status
      t.text   :description
      t.integer :request_id
      t.string :step

      t.timestamps
    end
  end

  def self.down
    drop_table :bids
  end
end

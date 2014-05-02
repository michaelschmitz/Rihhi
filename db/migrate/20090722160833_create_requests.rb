class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.string   :title
      t.text     :description
      t.float    :ideal_price
      t.integer  :quantity
      t.string   :tags
      t.string   :materials
      t.integer  :user_id
      t.string   :full_name
      t.string   :street
      t.string   :city
      t.string   :state
      t.string   :zip_code
      t.string   :country
      t.string   :request_status
      t.date     :deadline
      t.date     :expiry_date
      t.date     :posted_on
    

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end

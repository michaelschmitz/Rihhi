class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :listing_id
      t.string :seller_id
      t.string :user_id
      t.string :title
      t.string :description      

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end

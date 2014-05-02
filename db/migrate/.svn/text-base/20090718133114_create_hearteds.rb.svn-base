class CreateHearteds < ActiveRecord::Migration
  def self.up
    create_table :hearteds do |t|
      t.string :user_id
      t.string :listing_id

      t.timestamps
    end
  end

  def self.down
    drop_table :hearteds
  end
end

class CreateTlistings < ActiveRecord::Migration
  def self.up
    create_table :tlistings do |t|
      t.integer :ticket_id
      t.integer :listing_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tlistings
  end
end

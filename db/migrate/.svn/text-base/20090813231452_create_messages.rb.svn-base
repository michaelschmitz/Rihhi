class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.string :sender_name
      t.string :receiver_name
      t.string :title
      t.text :message
      t.string :read, :default => "No"
      t.string :sender_archived, :default => "No"
      t.string :receiver_archived, :default => "No"
      
      t.string :created_on

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end

class CreateFlaggeds < ActiveRecord::Migration
  def self.up
    create_table :flaggeds do |t|
      t.string :listing_id
      t.string :user_id
      t.string :flagger_id
      t.string :flagger_email
      t.string :email_sent
      t.string :reason
      t.string :deleted
      t.string :changed
      t.string :closed
      t.string :admin_id

      t.timestamps
    end
  end

  def self.down
    drop_table :flaggeds
  end
end

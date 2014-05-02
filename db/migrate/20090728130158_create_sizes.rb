class CreateSizes < ActiveRecord::Migration
  def self.up
    create_table :sizes do |t|
      t.integer :listing_id
      t.string :xxs
      t.string :xs
      t.string :s
      t.string :m
      t.string :l
      t.string :xl
      t.string :xxl
      t.string :xxxl
      t.string :all         #One size fits all

      t.timestamps
    end
  end

  def self.down
    drop_table :sizes
  end
end

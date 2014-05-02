class CreateLastcategories < ActiveRecord::Migration
  def self.up
    create_table :lastcategories do |t|
      t.string :name
      t.string :locale
      t.string :subcategory_id
      t.timestamps
    end
  end

  def self.down
    drop_table :lastcategories
  end
end

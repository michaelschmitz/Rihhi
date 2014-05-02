class CreateDraws < ActiveRecord::Migration
  def self.up
    create_table :draws do |t|
      t.integer :list
      t.integer :seller_id
      t.string :login_name
      t.string :name
      t.string :account_holder
      t.string :iban
      t.string :bic
      t.decimal :balance_now, :precision => 8, :scale => 2
      t.decimal :debited , :precision => 8, :scale => 2
      t.decimal :difference, :precision => 8, :scale => 2
      t.string :fail
      

      t.timestamps
    end
  end

  def self.down
    drop_table :draws
  end
end

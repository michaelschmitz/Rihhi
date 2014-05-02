class CreateMovements < ActiveRecord::Migration
  def self.up
    create_table :movements do |t|
      t.integer :seller_id                              #Connect this with a seller
      t.integer :code                                   #Integer code signifing kind of movement. 
                                                          #Code 1 is turnover,
                                                          #Code 2 is 0,20 Cent new item charge 
                                                          #Code 3 is debit for sale of 3%
                                                          #Code 4 is credit after monthly payment from seller to us
                                                          #Code 5 is Admin action: Increase or decrease of acc. balance.                                                         
      t.decimal :value, :precision => 8, :scale => 2    #How much money was moved?
      t.text :reason                                  #Whats the reason for the move?
      t.integer :email                                  #Was an email sent due to this move?
      t.boolean :dispute                                #Did the seller flick the dispute switch for this movement?
      t.integer :order_id                               #Connected to which order?

      t.timestamps
    end
  end

  def self.down
    drop_table :movements
  end
end

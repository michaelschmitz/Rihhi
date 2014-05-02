class CreateSellers < ActiveRecord::Migration
  def self.up
    create_table :sellers do |t|
      t.integer :user_id
      t.string  :full_name
      t.string  :street
      t.string  :post_code
      t.string  :city
      t.string  :area
      t.string  :country
      
      t.integer :rating #Whats the rating? Number of Stars from 1 to 5?
      t.integer :number_of_ratings #How often was this seller rated?
      t.integer :pos
      t.integer :neg
      
      #How shall we charge the seller?
      t.string :electronic_direct_debit                #Electronic direct debit, only for customers with a german bank account Options: a) Yes b) No
      t.string :account_holder_name  #Sellers full name
      t.string :account_number       #Sellers bank acount number
      t.string :bank_identifier      #Sellers bank code
      
      #Seller Account balance
      t.decimal :account_balance, :precision => 8, :scale => 2
      t.decimal :turnover, :precision => 8, :scale => 2
      t.decimal :last_account_balance, :precision => 8, :scale => 2
      t.decimal :lowest_account_balance, :precision => 8, :scale => 2
      t.string  :account_type        #Beta-Account? New account? Special admin account?
      
      t.string :spoken_languages
      
      #Sword Admin settings
      t.string :seller_status #Is this seller in good standing or set to inactive in violation of our rules? Options: a) Good b) Review c) Unpaid d)Banned
      t.string :terms_of_service
      t.timestamps
    end
  end

  def self.down
    drop_table :sellers
  end
end

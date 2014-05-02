class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
    t.integer :seller_id
    
    #Pre-sets for items
      t.string  :commercial_seller # All presets should be moved to pre-sets table down into shipping-comments
      t.string  :company_name
      t.string  :tax_number
      t.string  :percentage_vat
      t.string  :country1 #All pre-sets could be moved to pre-sets table
      t.string  :country2
      t.string  :country3
      t.string  :country4
      t.string  :country5
      t.decimal  :country1_shipping, :precision => 8, :scale => 2
      t.decimal  :country2_shipping, :precision => 8, :scale => 2
      t.decimal  :country3_shipping, :precision => 8, :scale => 2
      t.decimal  :country4_shipping, :precision => 8, :scale => 2
      t.decimal  :country5_shipping, :precision => 8, :scale => 2
      t.decimal  :country1_shipping_with_another_item, :precision => 8, :scale => 2
      t.decimal  :country2_shipping_with_another_item, :precision => 8, :scale => 2
      t.decimal  :country3_shipping_with_another_item, :precision => 8, :scale => 2
      t.decimal  :country4_shipping_with_another_item, :precision => 8, :scale => 2
      t.decimal  :country5_shipping_with_another_item, :precision => 8, :scale => 2
      t.string :country1_deliverytime
      t.string :country2_deliverytime
      t.string :country3_deliverytime
      t.string :country4_deliverytime        
      t.string :country5_deliverytime
      t.text   :shipping_comments # The last preset
      
    #How can buyers pay the seller? -> This can be in the pre-sets table
      t.string :allow_paypal
      t.string :paypal_account
      t.string :allow_bank_transfer
      t.string :bank_account_holder
      t.string :bank_bic
      t.string :bank_iban
      
      t.string :allow_cheque
      t.string :allow_cash_on_delivery 
      
      #Simple shop information and description -> Can be in pre-sets table
      t.string :shop_image_url #This is the draft idea of the avatar / shop picture
      t.text   :about_my_shop  #Should be changed to "about_me" and will be shown on the public profile/shop page
      t.text   :shop_tos
      t.text   :policy_on_returns_and_refunds #Text the seller can enter freely
      
      #Has the shop been setup?
      t.string :shop_has_been_setup
    t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end

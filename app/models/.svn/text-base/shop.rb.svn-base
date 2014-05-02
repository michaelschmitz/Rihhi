class Shop < ActiveRecord::Base
   belongs_to :seller
  
   has_attached_file :avatar,
                     :storage => :s3, 
                     :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                     :styles => { :medium => "200x200>", :thumb => "100x100>" },
                     :path => "shops/:id/:style/:basename.:extension"
                           
   validate_on_update :selected_payment
   
   validates_presence_of :paypal_account, :on => :update, :if => Proc.new { |u| u.allow_paypal == "Yes"}, :message => I18n.t("models.shop.s1")
   
   validates_presence_of :bank_account_holder,  :on => :update, :if => Proc.new { |u| u.allow_bank_transfer == "Yes"}, :message => I18n.t("models.shop.s2")
   validates_presence_of :bank_bic,             :on => :update, :if => Proc.new { |u| u.allow_bank_transfer == "Yes"}, :message => I18n.t("models.shop.s2")
   validates_presence_of :bank_iban,            :on => :update, :if => Proc.new { |u| u.allow_bank_transfer == "Yes"}, :message => I18n.t("models.shop.s2")
   
  private
  
  def selected_payment
    unless (allow_paypal == "Yes" or allow_bank_transfer == "Yes" or allow_cash_on_delivery == "Yes" or allow_cheque == "Yes")
      errors.add(:allow_paypal, I18n.t("models.shop.s3"))
      logger.info errors.map
    end
  end


  
#  :allow_cheque
#  :allow_cash_on_delivery
#  :allow_bank_transfer
#  :allow_paypal
  
  #:paypal_account
      
      #t.string :bank_account_holder
      #t.string :bank_bic
      #t.string :bank_iban

end

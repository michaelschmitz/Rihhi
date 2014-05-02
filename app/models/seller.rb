class Seller < ActiveRecord::Base
  belongs_to :user
  has_many :listings
  has_many :orders
  has_one :shop
  has_many :ratings
  has_many :bids, :dependent => :destroy
  has_many :movements
  has_many :draws
  
                            
  validates_presence_of     :full_name, :street, :post_code,
                            :city, :country, :message => I18n.t("models.seller.s1"), :on => :create

  validates_format_of       :country, :with => /country*/i, :message => I18n.t("models.seller.s2"), :on => :create
  validates_acceptance_of :terms_of_service, :message => I18n.t("models.seller.s3"), :on => :create

  
end

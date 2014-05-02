class Listing < ActiveRecord::Base
  belongs_to :seller     
  belongs_to :category
  belongs_to :subcategory
  belongs_to :lastcategory
  has_many :cart_items
  has_many :carts, :through => :cart_items
  has_and_belongs_to_many :lists
  has_many :favorites, :dependent => :destroy
  has_many :hearteds, :dependent => :destroy
  has_many :flaggeds, :dependent => :destroy
  has_many :deliverables
  has_one :size
  has_many :colors
  
  has_attached_file :pic1, 
                    :storage => :s3, 
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :styles => { :full => "800x800>", :medium => "480x480", :thumb => "150x150#", :small => "100x100#" },
                    :path => "listings/:id/:style/:basename.:extension"                       
  has_attached_file :pic2, 
                    :storage => :s3, 
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",                   
                    :styles => { :full => "800x800>", :medium => "480x480", :thumb => "150x150#", :small => "100x100#" },
                    :path => "listings/:id/:style/:basename.:extension"                    
  has_attached_file :pic3,
                    :storage => :s3, 
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :styles => { :full => "800x800>", :medium => "480x480", :thumb => "150x150#", :small => "100x100#" },
                    :path => "listings/:id/:style/:basename.:extension"
  has_attached_file :pic4,
                    :storage => :s3, 
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :styles => { :full => "800x800>", :medium => "480x480", :thumb => "150x150#", :small => "100x100#" },
                    :path => "listings/:id/:style/:basename.:extension" 
  #Translation of Errors in YAML file
                    
  #Step 1 Validation
  validates_presence_of     :title,                         :if => Proc.new { |u| u.complete == "step1"}, :message => I18n.t("models.listing.s1")
  validates_presence_of     :price,                         :if => Proc.new { |u| u.complete == "step1"}, :message => I18n.t("models.listing.s1")
  validates_presence_of     :description,                   :if => Proc.new { |u| u.complete == "step1"}, :message => I18n.t("models.listing.s1")
  validates_numericality_of :price,                         :if => Proc.new { |u| u.complete == "step1"}, :message => I18n.t("models.listing.s2")    
  validates_numericality_of :price, :greater_than => 0.01,  :if => Proc.new { |u| u.complete == "step1"}, :message => I18n.t("models.listing.s3") 
  
  validates_length_of       :title,                         :if => Proc.new { |u| u.complete == "step1"} && :title?,      :minimum => 2 , :message => I18n.t("models.listing.s4")
  validates_length_of       :description,                   :if => Proc.new { |u| u.complete == "step1"} && :description?,:minimum => 5 , :message => I18n.t("models.listing.s4")               
  validates_numericality_of :nr_of_items_in_stock, :greater_than => -1,          :if => Proc.new { |u| u.complete == "step1"}, :message => I18n.t("models.listing.s5")      
  
  #Step 2 Validation  
  validates_presence_of     :category_id,                   :if => Proc.new { |u| u.complete == "step2"}, :message => I18n.t("models.listing.s6")
  validates_presence_of     :subcategory_id,                :if => Proc.new { |u| u.complete == "step2"}, :message => I18n.t("models.listing.s7")
  
  validates_numericality_of :category_id,  :greater_than => 0,  :if => Proc.new { |u| u.complete == "step2"}, :message => I18n.t("models.listing.s8")
  validates_numericality_of :subcategory_id, :greater_than => 0,  :if => Proc.new { |u| u.complete == "step2"}, :message =>I18n.t("models.listing.s9")

  #Step 3 Colors and sizes are validated directly in the controller as they are not a part of the model

  #Step 4 Validation - Shipping costs and delivery times for country 1. Comment may be empty
  validates_presence_of     :country1,              :if => Proc.new { |u| u.complete == "step4"}

  validates_presence_of     :country1_shipping,                      :if => Proc.new { |u| u.complete == "step4"} && :country1?, :message => I18n.t("models.listing.s1")
  validates_presence_of     :country1_shipping_with_another_item,    :if => Proc.new { |u| u.complete == "step4"} && :country1?, :message => I18n.t("models.listing.s1")
  validates_presence_of     :country1_deliverytime,                  :if => Proc.new { |u| u.complete == "step4"} && :country1?, :message => I18n.t("models.listing.s1")    
  validates_numericality_of :preparation_time,                       :if => Proc.new { |u| u.complete == "step4"},  :greater_than => -1,      :message => I18n.t("models.listing.s10")   
  validates_numericality_of :country1_shipping,                      :if => Proc.new { |u| u.complete == "step4"},  :greater_than => -0.01,   :message => I18n.t("models.listing.s2")
  validates_numericality_of :country1_shipping_with_another_item,    :if => Proc.new { |u| u.complete == "step4"},  :greater_than => -0.01,   :message => I18n.t("models.listing.s2")  
  
  validates_presence_of     :country2_shipping,                      :if => Proc.new { |u| u.complete == "step4" and u.country2 != "-------"}, :message => I18n.t("models.listing.s11")
  validates_presence_of     :country2_shipping_with_another_item,    :if => Proc.new { |u| u.complete == "step4" and u.country2 != "-------"}, :message => I18n.t("models.listing.s11")
  validates_presence_of     :country2_deliverytime,                  :if => Proc.new { |u| u.complete == "step4" and u.country2 != "-------"}, :message => I18n.t("models.listing.s11")
  validates_numericality_of :country2_shipping,                      :if => Proc.new { |u| u.complete == "step4" and u.country2 != "-------"},  :greater_than => -0.01,   :message => I18n.t("models.listing.s2")
  validates_numericality_of :country2_shipping_with_another_item,    :if => Proc.new { |u| u.complete == "step4" and u.country2 != "-------"},  :greater_than => -0.01,   :message => I18n.t("models.listing.s3") 
  
  validates_presence_of     :country3_shipping,                      :if => Proc.new { |u| u.complete == "step4" and u.country3 != "-------"}, :message => I18n.t("models.listing.s12")
  validates_presence_of     :country3_shipping_with_another_item,    :if => Proc.new { |u| u.complete == "step4" and u.country3 != "-------"}, :message => I18n.t("models.listing.s12")
  validates_presence_of     :country3_deliverytime,                  :if => Proc.new { |u| u.complete == "step4" and u.country3 != "-------"}, :message => I18n.t("models.listing.s12")
  validates_numericality_of :country3_shipping,                      :if => Proc.new { |u| u.complete == "step4" and u.country3 != "-------"},  :greater_than => -0.01,   :message => I18n.t("models.listing.s2")
  validates_numericality_of :country3_shipping_with_another_item,    :if => Proc.new { |u| u.complete == "step4" and u.country3 != "-------"},  :greater_than => -0.01,   :message => I18n.t("models.listing.s3")
  
  validates_presence_of     :country4_shipping,                      :if => Proc.new { |u| u.complete == "step4" and u.country4 != "-------"}, :message => I18n.t("models.listing.s13")
  validates_presence_of     :country4_shipping_with_another_item,    :if => Proc.new { |u| u.complete == "step4" and u.country4 != "-------"}, :message => I18n.t("models.listing.s13")
  validates_presence_of     :country4_deliverytime,                  :if => Proc.new { |u| u.complete == "step4" and u.country4 != "-------"}, :message => I18n.t("models.listing.s13")
  validates_numericality_of :country4_shipping,                      :if => Proc.new { |u| u.complete == "step4" and u.country4 != "-------"},  :greater_than => -0.01,   :message => I18n.t("models.listing.s2")
  validates_numericality_of :country4_shipping_with_another_item,    :if => Proc.new { |u| u.complete == "step4" and u.country4 != "-------"},  :greater_than => -0.01,   :message => I18n.t("models.listing.s3")
  
  validates_presence_of     :country5_shipping,                      :if => Proc.new { |u| u.complete == "step4" and u.country5 != "-------"}, :message => I18n.t("models.listing.s14")
  validates_presence_of     :country5_shipping_with_another_item,    :if => Proc.new { |u| u.complete == "step4" and u.country5 != "-------"}, :message => I18n.t("models.listing.s14")
  validates_presence_of     :country5_deliverytime,                  :if => Proc.new { |u| u.complete == "step4" and u.country5 != "-------"}, :message => I18n.t("models.listing.s14")
  validates_numericality_of :country5_shipping,                      :if => Proc.new { |u| u.complete == "step4" and u.country5 != "-------"},  :greater_than => -0.01,   :message => I18n.t("models.listing.s2")
  validates_numericality_of :country5_shipping_with_another_item,    :if => Proc.new { |u| u.complete == "step4" and u.country5 != "-------"},  :greater_than => -0.01,   :message => I18n.t("models.listing.s3")
  
  def self.find_category(cat, page)
  paginate :per_page => 12, :page => page,
           :conditions => ['creation = ? and category_id = ?', "completed", cat]
  end

end

class Order < ActiveRecord::Base
  has_many :deliverables, :dependent => :destroy
  belongs_to :user
  belongs_to :seller
  has_one :rating, :dependent => :destroy
  has_many :movements

  
  #Validation 3 - Buy now.
  validates_presence_of     :user_fullname,                   :if => Proc.new { |u| u.step == "step3"}, :message => I18n.t("models.order.s1")
  validates_presence_of     :user_address,                    :if => Proc.new { |u| u.step == "step3"}, :message => I18n.t("models.order.s2")
  validates_presence_of     :user_areacode,                   :if => Proc.new { |u| u.step == "step3"}, :message => I18n.t("models.order.s3")
  validates_presence_of     :user_city,                       :if => Proc.new { |u| u.step == "step3"}, :message => I18n.t("models.order.s4")
  validates_presence_of     :user_country,                    :if => Proc.new { |u| u.step == "step3"}, :message => I18n.t("models.order.s5")
  validates_exclusion_of    :user_country,                    :if => Proc.new { |u| u.step == "step3"} && :user_country?, :in => %w{ ------- }, :message => I18n.t("models.order.s6")  
  validates_presence_of     :payment_chosen,                  :if => Proc.new { |u| u.step == "step3"}, :message => I18n.t("models.order.s7")

 validates_presence_of   :cancel_reason, :if => Proc.new { |u| u.status == "cancelled"}

  
end
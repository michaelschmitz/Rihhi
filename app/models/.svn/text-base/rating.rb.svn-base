class Rating < ActiveRecord::Base
  belongs_to :order
  belongs_to :seller
  belongs_to :user
  
  validates_presence_of     :userrating, :message => I18n.t("models.rating.s1")
end

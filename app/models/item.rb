class Item < ActiveRecord::Base
  belongs_to :order
  belongs_to :seller
  belongs_to :user
  belongs_to :listing
end

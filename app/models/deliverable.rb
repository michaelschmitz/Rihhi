class Deliverable < ActiveRecord::Base
  belongs_to :listing
  belongs_to :order
end

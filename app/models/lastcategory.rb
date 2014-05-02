class Lastcategory < ActiveRecord::Base
   belongs_to :subcategories
   has_many :listings
end

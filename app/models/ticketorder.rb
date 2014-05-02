class Ticketorder < ActiveRecord::Base
   belongs_to :ticket
   belongs_to :user     #Represents the buyer
   belongs_to :vendor,
              :class_name => "User",
              :foreign_key => "vendor_id"
end

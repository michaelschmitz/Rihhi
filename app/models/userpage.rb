class Userpage < ActiveRecord::Base
  belongs_to :user
 
  has_attached_file :avatar,
                    :storage => :s3, 
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :styles => { :medium => "200x200>", :thumb => "100x100#" },
                    :path => ":attachment/:id/:style.:extension"

end

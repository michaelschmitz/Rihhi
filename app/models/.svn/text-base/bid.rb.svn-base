class Bid < ActiveRecord::Base
  belongs_to :request
  belongs_to :seller
  
  has_attached_file :attachment,
                      :storage => :s3, 
                      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                      :styles => { :medium => "300x300>", :thumb => "100x100>" },                      
                      :path => "bids/:style/:basename.:extension"
                     
  validates_presence_of     :description,          :if => Proc.new { |u| u.step == "step1"}, :message => "Can't be blank" 
  validates_presence_of     :final_cost,           :if => Proc.new { |u| u.step == "step1"}, :message => "Can't be blank"
  validates_presence_of     :preparation_time,     :if => Proc.new { |u| u.step == "step1"}, :message => "Can't be blank"   
  
  validates_length_of       :description,          :if => Proc.new { |u| u.step == "step1" and :description?}, :minimum => 5 , :message => "At least 5 characters"
    
end 

class Event < ActiveRecord::Base
  has_many :tickets

  belongs_to :user
  
    has_attached_file :pic1, 
                      :storage => :s3, 
                      :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                      :styles => { :full => "800x800>", :medium => "520x200", :thumb => "155x125>", :small => "100x100" },
                      :path => "events/:id/:style/:basename.:extension"                       

  
  #Step1 - New
  validates_presence_of     :title,         :if => Proc.new { |u| u.complete == "step1"}
  validates_presence_of     :description,   :if => Proc.new { |u| u.complete == "step1"}
  validates_length_of       :description,   :within => 20..1500,     :if => :description?, :message => "Should be a bit longer."
  validates_presence_of     :city,          :if => Proc.new { |u| u.complete == "step1"}
  validates_presence_of     :region,        :if => Proc.new { |u| u.complete == "step1"}
  validates_presence_of     :area_code,     :if => Proc.new { |u| u.complete == "step1"}  
  validates_format_of       :country, :with => /^[A-Z%-]/i, :message => "Please select a country",  :if => Proc.new { |u| u.complete == "step1"} #Regexp to check that only A-Z, case insensitive, are included.
              
  #Step2 - New
    #Requires no validations
    
  #Step3 - New 
   validates_presence_of     :orga_name,                :if => Proc.new { |u| u.complete == "step3"}
   validates_length_of       :orga_name,                :within => 5..100, :if => :orga_name?
   validates_presence_of     :orga_email,               :if => Proc.new { |u| u.complete == "step3"}   
   validates_length_of       :orga_email,               :within => 5..100,:if => :orga_email?
   validates_format_of       :orga_email,               :with => /^[A-Z0-9._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i, :message => "Must be a valid email address" ,:if => :orga_email?
   validates_presence_of     :name_of_contact1,         :if => Proc.new { |u| u.complete == "step3"}
   validates_length_of       :name_of_contact1,         :within => 5..100, :if => :name_of_contact1?
  
  #Step4 - New 
  validates_presence_of     :available_sc,                  :if => Proc.new { |u| u.complete == "step4"}
  validates_presence_of     :max_sc,                        :if => Proc.new { |u| u.complete == "step4"}
  validates_presence_of     :available_nsc,                 :if => Proc.new { |u| u.complete == "step4"}
  validates_presence_of     :max_nsc,                       :if => Proc.new { |u| u.complete == "step4"}
  
  def self.search_index(per_page, page)
    paginate :per_page => per_page, :page => page
  end
  
  
end

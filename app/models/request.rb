class Request < ActiveRecord::Base
  has_many :bids, :dependent => :destroy
  belongs_to :user
  
  has_attached_file :attachment,
                    :storage => :s3, 
                    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :path => "requests/:id/:style/:basename.:extension"
                           
   
  
  validates_presence_of     :title,         :message => "Can't be blank"
  validates_presence_of     :ideal_price,   :message => "Can't be blank"
  validates_presence_of     :description,   :message => "Can't be blank"
  validates_presence_of     :quantity,      :message => "Can't be blank"
  validates_presence_of     :deadline,      :message => "Can't be blank"
  validates_presence_of     :full_name,     :message => "Can't be blank"
  validates_presence_of     :street,        :message => "Can't be blank"
  validates_presence_of     :city,          :message => "Can't be blank"
  validates_presence_of     :state,         :message => "Can't be blank"
  validates_presence_of     :zip_code,      :message => "Can't be blank"
  validates_presence_of     :country,       :message => "Can't be blank"
   
  validates_length_of       :title,        :if => :title?,      :minimum => 2 , :message => "At least 2 characters"
  validates_length_of       :description,  :if => :description?,:minimum => 5 , :message => "At least 5 characters"
  validates_length_of       :full_name,    :if => :full_name?,      :minimum => 5 , :message => "At least 5 characters"
  validates_length_of       :street,       :if => :street?,:minimum => 5 , :message => "At least 5 characters"
  validates_length_of       :city,         :if => :city?,      :minimum => 4 , :message => "At least 4 characters"
  validates_length_of       :state,        :if => :state?,:minimum => 2 , :message => "At least 2 characters"
  validates_length_of       :zip_code,     :if => :zip_code?,      :minimum => 5 , :message => "At least 5 characters"
  validates_length_of       :country,      :if => :country?,:minimum => 2 , :message => "At least 2 characters"
  
  validates_numericality_of :ideal_price,  :message => "Should look like 5.99"    
  validates_numericality_of :ideal_price,  :greater_than => 0.01, :message => "Price should be more than one cent."
  validates_format_of       :ideal_price,  :if =>  :ideal_price?,     :with => /^[0-9-]+\.+[0-9]{2}$/i, :message => "Should contain two decimals <br> Use dot instead of comma"
 
  validates_numericality_of :quantity,     :greater_than => 0,     :message => "Should be a number greater than 0." 
  
  
  #validates_numericality_of :deadline :now plus 3 month, das ist das maximale deadline-datum, der user kann ein kürzeres angeben 
  #validates_format_of       :deadline :seite 400  
  
  def self.search_index(per_page, page)
    paginate :per_page => per_page, :page => page
  end

end

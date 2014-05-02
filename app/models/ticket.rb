class Ticket < ActiveRecord::Base
  belongs_to :event
  has_many :tlistings
  has_many :ticketorders
  
  validates_presence_of     :name                        , :message => "Can't be blank"
  validates_presence_of     :description                 , :message => "Please provide a short description."
  
  def self.search_index(per_page, page)
    paginate :per_page => per_page, :page => page
  end
   

  
end

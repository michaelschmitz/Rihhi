class ProfilesController < ApplicationController
  before_filter :login_required

  def show 
    @user = self.current_user
    @orders = Order.find(:all, :conditions => ["user_id = ? and status != ?", self.current_user.id.to_s, "closed"])
    @favorites = Favorite.find(:all, :conditions => ["user_id = ?", @user.id.to_s])
    @hearteds = Hearted.find(:all, :conditions => ["user_id = ?", @user.id.to_s])
    @flaggeds = Flagged.find(:all, :conditions => ["user_id = ? and deleted = ?", @user.id.to_s, "yes"])
    #@open_requests = Request.find(:all, :conditions => ["user_id = ? and request_status = ?", @user.id, "open"])
    #@closed_requests = Request.find(:all, :conditions => ["user_id = ? and request_status = ?", @user.id, "closed"])
    @orders_status_ordered = Order.find(:all, :conditions => ["user_id = ? and step = ?", self.current_user.id.to_s, "step4"]) 
    @buyer_ratings = Rating.find(:all, :conditions => ["user_id = ? AND user_has_rated != ?", self.current_user.id.to_s, 0])
    @friend_request = Friend.find(:all, :conditions => ["friend_id = ? and status = ?", @user.id, "requested"])
    if self.current_user.is_seller?
      @x = @user.seller.id.to_s
    #Seller only
    @shop = Shop.find(:first, :conditions => ["seller_id = ?", @user.seller.to_s])
    @listings = Listing.find( :all, 
                              :conditions => ["seller_id = ? and nr_of_items_in_stock >= ? and removed = ? and creation = ?", @x, 1, "0", "completed"])
    @out_of_stock = Listing.find( :all,
                                  :conditions => ["seller_id = ? and nr_of_items_in_stock = ? and removed = ? and creation = ?", @x, 0, "0", "completed"])
    @sales = Order.find(:all, :conditions => ["seller_id = ?", @x])
    #@bids = Bid.find(:all, :conditions => ["seller_id = ?", @user.seller])
    #@bids_accepted = Bid.find(:all, :conditions => ["seller_id = ?", @user.seller])    
    @orders_status_complete = Order.find(:all, :conditions => ["user_id = ? and (status = ? or status = ?)", self.current_user.id.to_s, "closed", "cancelled"])
    @sales_status_complete = Order.find(:all, :conditions => ["seller_id = ? and (status = ? or status = ?)", self.current_user.seller.id.to_s, "closed", "cancelled"])
    @ratings = Rating.find(:all, :conditions => ["seller_id = ? AND user_has_rated != ?", self.current_user.seller.id.to_s, 0])  
      #Movements & Turnover
      @movements = Movement.find(:all, :conditions => ["seller_id = ?", self.current_user.seller.id.to_s]).reverse!
      @total_turnover = 0.00
      @movements.each do |m|
        #Turnover calculation
        if m.code == 1
         @total_turnover += m.value 
        end
      end
      
    end
    
    @messages = Message.find(:all, :conditions => ["receiver_id = ? and receiver_archived = ?", self.current_user, "No"])
    @unreadmessages = Message.find(:all, :conditions => { :receiver_id => self.current_user, :receiver_archived => "No", :read => "No"})
    @sentmail = Message.find(:all, :conditions => ["sender_id = ? and receiver_archived = ?", self.current_user, "No"])
    
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.profiles.s1")
    @l2_link = profile_path
    @l2_name = t("controllers.profiles.s2")
  end
end

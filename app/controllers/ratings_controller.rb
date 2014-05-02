class RatingsController < ApplicationController
  before_filter :login_required, :except => :show
  # GET /ratings
  # GET /ratings.xml
  #All feedbacks 
  def index
    page = params[:page] || 1
    @ratings = Rating.paginate(:page => page, :per_page => 15, :conditions => ["user_id = ? and user_has_rated = ?", self.current_user.id, 0]).reverse!
    @l1_link = profile_path
    @l1_name = t("controllers.ratings.s1")
    @l2_link = ""
    @l2_name = t("controllers.ratings.s2")  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ratings }
    end
  end

  def index2 #All feedback
    @users_older_ratings = Rating.find(:all, :conditions => ["user_id = ? AND user_has_rated = ?", self.current_user.id, 1]).reverse!
 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ratings }
    end
  end
  
  # GET /ratings/1
  # GET /ratings/1.xml
  #Show all feedbacks for one seller.
  def show
    page = params[:page] || 1
    @seller = Seller.find(params[:id])
    @ratings = Rating.paginate(:page => page, :per_page => 20, :conditions => ["seller_id = ? AND userrating <= ?", @seller.id, 2], :order => 'id DESC')
    @all_ratings = Rating.find(:all, :conditions => ["seller_id = ? AND userrating <= ?", @seller.id, 2])
    #calculate positive and negative ratings
    pos = 0.0
    neg = 0.0
    if @all_ratings != nil 
      @all_ratings.each do |r|
        if r.userrating == 2
          pos += 1.0
        else
          neg += 1.0
        end
      end
    end
   @pos = pos
   @neg = neg  
   @result = (pos/(neg+pos))*100
   
   #Breadcrumbs
   @l1_link = profile_path
   @l1_name = "My Account"
   @l2_link = ""
   @l2_name = "Feedback"  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.xml
  def new
    @rating = Rating.new
    @order = Order.find(params[:id])
    @rating.order_id = @order.id
    @rating.user_id = self.current_user.id
    @rating.seller_id = @order.seller_id
    @total_cost_of_deliverables = @order.price_of_all_deliverables
    @total_cost_of_shipping = @order.cost_of_shipping
    @total_cost = @total_cost_of_deliverables + @total_cost_of_shipping
     
         #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.ratings.s1")   
    @l2_link = "" 
    @l2_name = t("controllers.ratings.s3")
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rating }
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = Rating.find(:first, :conditions => ["id = ? and seller_id = ?", params[:id], self.current_user.seller.id])
    logger.info @rating.inspect
    
    logger.info @rating.order_id.to_i
    @order = Order.find(@rating.order_id)
    @total_cost_of_deliverables = @order.price_of_all_deliverables
    @total_cost_of_shipping = @order.cost_of_shipping
    @total_cost = @total_cost_of_deliverables + @total_cost_of_shipping
     
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.ratings.s1")   
    @l2_link = "" 
    @l2_name = t("controllers.ratings.s4")
  end

  # POST /ratings
  # POST /ratings.xml
  def create
    @rating = Rating.new(params[:rating])
    @order = Order.find(@rating.order_id)
    @order.status = "buyerfeedback_received"
    @order.date_buyerfeedback_received = Time.now
    @order.save
    @seller = Seller.find(@order.seller_id)
    @deliverables = Deliverable.find(:all, :conditions => ["order_id = ?", @order.id])
    respond_to do |format|
      if @rating.save   
          @all_ratings = Rating.find(:all, :conditions => ["seller_id = ? AND userrating <= ?", @seller.id, 2])
          #calculate positive and negative ratings after save for the correct number
          pos = 0.0
          neg = 0.0
          if @all_ratings != nil 
            @all_ratings.each do |r|
              if r.userrating == 2
                pos += 1.0
              else
                neg += 1.0
              end
            end
          end
          @pos = pos
          @neg = neg  
          @result = (pos/(neg+pos))*100
          @seller.rating = @result
          @seller.number_of_ratings = pos + neg
          @seller.pos = pos
          @seller.neg = neg
          @seller.save

          @user = User.find(@order.user_id)          
          @seller_user = @seller.user    
          
                
        current_language = session[:locale]
        I18n.locale = @seller.user.userpage.preferred_language
        SystemMailer.deliver_sale4(@user, @seller_user, @seller, @order, @rating, @deliverables)
        I18n.locale = current_language
        
        flash[:notice] = t("controllers.ratings.s5")
        format.html { redirect_to :action => 'show', :id => @seller.id}
        format.xml  { render :xml => @rating, :status => :created, :location => @rating }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ratings/1
  # PUT /ratings/1.xml
  def update
    @rating = Rating.find(params[:id])
    @rating.sellertext = params[:rating][:sellertext]
    @order = Order.find(@rating.order_id)
    @order.status = "closed"
    @order.date_sellerfeedback_received = Time.now
    @order.date_closed = Time.now
    @order.save
    @seller = Seller.find(@order.seller_id)
    
    #Movement: Charge the account with 3% of total order cost
    @value =  ((@order.total_cost_of_order.to_f/100)*3).round_with_precision(2)  
    @movement = Movement.new
    @movement.code = 3
    @movement.reason = t("controllers.ratings.s6") + @order.id.to_s + t("controllers.ratings.s7") + @value.to_s + " Euro."
    @movement.value = @value
    @movement.email = 0
    @movement.dispute = 0
    @movement.order_id = @order.id
    @movement.seller_id = @order.seller_id
    @movement.save
    #Charge seller account balance
   @seller.account_balance += @value
    logger.info @seller.account_balance.to_s        
    #Movement: Increase turnover by order value
    @value = (@order.total_cost_of_order.to_f).round_with_precision(2)  
    @movement = Movement.new
    @movement.code = 1
    @movement.reason = t("controllers.ratings.s6") + @order.id.to_s + t("controllers.ratings.s8") + @value.to_s + " Euro."
    @movement.value = @value
    @movement.email = 0
    @movement.dispute = 0
    @movement.order_id = @order.id
    @movement.seller_id = @order.seller_id
    @movement.save
    #Increase turnover, save seller stats
    @seller.turnover += @value
    logger.info "new turnover " + @seller.turnover.to_s
    @seller.save
    respond_to do |format|
      if @rating.save
         @user = User.find(@order.user_id)          
         @seller_user = @seller.user    
         @seller = Seller.find(@rating.seller_id)
         @sellertext = @rating.sellertext
         @deliverables = Deliverable.find(:all, :conditions => ["order_id = ?", @order.id])
        
        current_language = session[:locale]
        I18n.locale = @user.userpage.preferred_language 
        SystemMailer.deliver_sale5(@user, @seller_user, @seller, @order, @rating, @sellertext, @deliverables)
        I18n.locale = current_language
        
        SystemMailer.deliver_movement1(@order, @seller_user, @seller)
        flash[:notice] = t("controllers.ratings.s9")
        format.html { redirect_to :action => 'show', :id => @rating.seller_id}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rating.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.xml
  def destroy
    @rating = Rating.find(params[:id])


    respond_to do |format|
      format.html { redirect_to(ratings_url) }
      format.xml  { head :ok }
    end
  end
  
  
end

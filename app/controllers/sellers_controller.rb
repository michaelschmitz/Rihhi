class SellersController < ApplicationController
  before_filter :login_required

  
  # GET /sellers
  # GET /sellers.xml
  def index
    user = User.find(params[:user_id])
    @seller = user.seller.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sellers }
    end
  end

  # GET /sellers/1
  # GET /sellers/1.xml
  def show
    if params[:user_id]
      @seller = User.find(params[:user_id]).seller
    else      
      @seller = Seller.find(params[:id]) #self.current_user.seller.id)        
    end
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @seller }
    end
  end

  # GET /sellers/new
  # GET /sellers/new.xml
  def new
    @seller = Seller.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @seller }
    end
  end

  # GET /sellers/1/edit
  def edit
    @user = self.current_user
    @seller = Seller.find(self.current_user.seller.id)
    
    @l1_link = profile_path
    @l1_name = t("controllers.sellers.s1")     
    @l2_link = sellersettings_path 
    @l2_name = t("controllers.sellers.s2")
  end

  # POST /sellers
  # POST /sellers.xml
  def create
    if !self.current_user.is_seller?
      @seller = Seller.new(params[:seller])
      @seller.user = User.find(self.current_user.id)
      @seller.user.write_attribute(:is_seller, true)
      @seller.rating = 0
      @seller.number_of_ratings = 0
      @seller.pos = 0
      @seller.neg = 0
      if @g_bonus_enabled == 1
        @seller.account_balance = -5.0
      else
        @seller.account_balance = 0.0
      end
      @seller.turnover = 0.0
      
      @test = @seller.id
      respond_to do |format|
        if @seller.save && @seller.user.save
          @shop = Shop.new(:seller_id => @seller.id)
          @shop.country1 = "country.Germany"
          @shop.country1_shipping = "3"
          @shop.country1_shipping_with_another_item = "2"
          @shop.country1_deliverytime = "5" 
          @shop.country2 = "country.European_Union"
          @shop.country2_shipping = "5"        
          @shop.country2_shipping_with_another_item = "3"        
          @shop.country2_deliverytime = "6-9"
          @shop.country3 = "country.Everywhere"
          @shop.country3_shipping = "15"        
          @shop.country3_shipping_with_another_item = "10"        
          @shop.country3_deliverytime = "10-30"
          @shop.country4 = "-------"
          @shop.country5 = "-------"
          @shop.allow_paypal = "Yes"
          @shop.paypal_account = @seller.user.email
          @shop.allow_bank_transfer = "No"
          @shop.allow_cheque = "No"
          @shop.allow_cash_on_delivery = "No"
          @shop.save   
          
          @value =  5.00 
          @movement = Movement.new
          @movement.code = 5 #Balance increase
          @movement.reason = t("controllers.sellers.s5") + @value.to_s + " Euro."
          @movement.value = @value
          @movement.email = 0
          @movement.dispute = 0      
          @movement.seller_id = @seller.id
          @movement.save
        
          @user = self.current_user
          SystemMailer.deliver_seller(@user, @seller)
          flash[:notice_good] = t("controllers.sellers.s3")
          format.html { redirect_to paymentoptions_path }
          format.xml  { render :xml => @seller, :status => :created, :location => @seller }  
        else
          format.html { render :controller=> "seller", :action => "new" }
          format.xml  { render :xml => @seller.errors, :status => :unprocessable_entity }
        end
    end
  else
    flash[:notice_good] = t("controllers.sellers.s3")
    redirect_to profile_path
    
    end
  end

  # PUT /sellers/1
  # PUT /sellers/1.xml
  def update
    @seller = Seller.find(self.current_user.seller.id)
  
    respond_to do |format|
      if @seller.update_attributes(params[:seller])
        flash[:notice] = t("controllers.sellers.s4")
        format.html { redirect_to profile_path() }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @seller.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.xml
  def destroy
    @seller = Seller.find(params[:id])
    

    respond_to do |format|
      format.html { redirect_to(sellers_url) }
      format.xml  { head :ok }
    end
  end
end
class ShopsController < ApplicationController
  # GET /shops
  # GET /shops.xml
  def index
    @shops = Shop.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shops }
    end
  end

  # GET /shops/1
  # GET /shops/1.xml
  def show
    @shop = Shop.find(params[:id])
    @seller = @shop.seller
    page = params[:page] || 1
    events_page = params[:events_page] || 1
    tickets_page = params[:tickets_page] || 1
    @listings = Listing.paginate(:page => page, :per_page => 10, :conditions => ["seller_id = ? and removed = ? and nr_of_items_in_stock >= ? and creation = ?", @seller, "0", 1, "completed" ])
    @events = Event.paginate(:page => events_page, :per_page => 10, :conditions => ["user_id = ?", @seller.user.id])
    @tickets = Ticket.paginate(:page => tickets_page, :per_page => 10, :conditions => ["seller_id = ?", @seller.id])
    
    @all_listings = Listing.find(:all, :conditions => ["seller_id = ? and removed = ? and nr_of_items_in_stock >= ? and creation = ?", @seller, "0", 1, "completed" ])
    @all_events = Event.find(:all, :conditions => ["user_id = ?", @seller.user.id])
    @all_tickets = Ticket.find(:all, :conditions => ["seller_id = ?", @seller.id])
    
    #Define breadcrumbs
    @l1_link = shop_path()
    @l1_name = "Shop " + @shop.id.to_s     
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shop }
    end
  end

  # GET /shops/new
  # GET /shops/new.xml
  def new
    @shop = Shop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shop }
    end
  end

  # GET /shops/1/edit
  def edit
    @user = self.current_user  
    @shop = Shop.find(:first, :conditions => ["seller_id = ?", @user.seller.id]) #This is correct. Now make sure that the "new seller" gives the right id to the shop.
    
    @l1_link = profile_path
    @l1_name = t("controllers.shops.s1")
    @l2_link = shopsettings_path 
    @l2_name = t("controllers.shops.s2") 
  end
  
  def shipping_presets
    @user = self.current_user  
    @shop = Shop.find(:first, :conditions => ["seller_id = ?", @user.seller.id])
    
    @l1_link = profile_path
    @l1_name = t("controllers.shops.s1")  
    @l2_link = shippingpresets_path 
    @l2_name = t("controllers.shops.s3") 
  end
  
  def payment_options
    @user = self.current_user  
    @shop = Shop.find(:first, :conditions => ["seller_id = ?", @user.seller.id])  
    @seller = @user.seller
    
    @l1_link = profile_path
    @l1_name = t("controllers.shops.s1")     
    @l2_link = paymentoptions_path 
    @l2_name = t("controllers.shops.s4") 
  end

  # POST /shops
  # POST /shops.xml
  def create
    @shop = Shop.new(params[:shop])

    respond_to do |format|
      if @shop.save
        flash[:notice] = t("controllers.shops.s5")
        format.html { redirect_to(@shop)  }
        format.xml  { render :xml => @shop, :status => :created, :location => @shop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shop.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  # PUT /shops/1
  # PUT /shops/1.xml
  def update
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(params[:shop])
        flash[:notice] = t("controllers.shops.s6")
        redirect_to shop_path, :id => @shop 
      else
        flash[:notice_bad] = t("controllers.shops.s7")
        render :action => "edit"
    end
  end

  #Update Payment Options
  def shop_update5
    @shop = Shop.find(params[:id])
    if @shop.update_attributes(params[:shop])
        flash[:notice] = t("controllers.shops.s6")
        redirect_to shop_path, :id => @shop 
      else
        flash[:notice_bad] = t("controllers.shops.s7")
        render :action => "payment_options"
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.xml
  def destroy
    @shop = Shop.find(params[:id])
    

    respond_to do |format|
      format.html { redirect_to(shops_url) }
      format.xml  { head :ok }
    end
  end
end

class BidsController < ApplicationController
  # GET /bids
  # GET /bids.xml
  def index    
    @bids = Bid.find(:all,
                     :conditions => ["seller_id = ?", self.current_user.id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bids }
    end
  end

  # GET /bids/1
  # GET /bids/1.xml
  def show
    @bid = Bid.find(params[:id])
    @seller = Seller.find(:first,
                          :conditions => ["user_id = ?", @bid.seller_id]) 
    @shop = Shop.find(:first,
                      :conditions => ["seller_id = ?", @bid.seller_id])   
    @request = Request.find(:first,
                            :conditions => ["id = ?", @bid.request_id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bid }
    end
  end

  # GET /bids/new
  # GET /bids/new.xml
  def new
    @bid = Bid.new  
    @bid.request_id = params[:request_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bid }
    end
  end

  # GET /bids/1/edit
  def edit
    @bid = Bid.find(:first,
                          :conditions => ["seller_id = ? and id = ? ", self.current_user.seller.id, params[:id]]) 
  end

  # POST /bids
  # POST /bids.xml
  def create
    @bid = Bid.new(params[:bid])
    @bid.seller_id = self.current_user.seller.id    
    @bid.bid_status = "open"
    @bid.step = "step1"
    respond_to do |format|
      if @bid.save
        flash[:notice] = 'Bid was successfully created.'
        format.html { redirect_to(@bid) }
        format.xml  { render :xml => @bid, :status => :created, :location => @bid }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bid.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bids/1
  # PUT /bids/1.xml
  def update
    @bid = Bid.find(:first,
                          :conditions => ["seller_id = ? and id = ? ", self.current_user.seller.id, params[:id]]) 
    @bid.step = "step1"

    respond_to do |format|
      if @bid.update_attributes(params[:bid])
        flash[:notice] = 'Bid was successfully updated.'
        format.html { redirect_to(@bid) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bid.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def bid_status   
   @bid = self.current_user.requests   
   #I need to post this on stackoverflow
   #@bid = self.current_user.requests.bids(params[:id])
   #My workaround (why do i need this?)
   @bid = Bid.find_by_id(params[:id])
   request = @bid.request
   if request.user.id == self.current_user.id
     logger.info "Request and id match"
   else
      logger.info "XXX.Error. Failure."
   end
   @bid.step = "step5"
   @hashy = {:bid_status => params[:new_status] }
    
    respond_to do |format|
      if @bid.update_attributes!(@hashy)        
        if @bid.bid_status == "accepted"
           format.html { redirect_to(@bid) }
           format.xml  { head :ok }
        else
           format.html { redirect_to(request) }
           format.xml  { head :ok }
        end
        
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.xml
  def destroy
    @bid = Bid.find(:first,
                          :conditions => ["seller_id = ? and id = ? ", self.current_user.seller.id, params[:id]]) 
    if @bid.bid_status != "accepted" or @bid.bid_status != "completed"
      @bid.destroy
    else
      logger.info "XXX. Intrusion attempt."  
    end
  
    respond_to do |format|
      format.html { redirect_to(bids_url) }
      format.xml  { head :ok }
    end
  end
end

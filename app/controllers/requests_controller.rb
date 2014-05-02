class RequestsController < ApplicationController
  before_filter :login_required, :except => [:index, :show, :autocomplete_search]
  # GET /requests
  # GET /requests.xml
  def index
     if params[:search]
      @search = Search.new(params[:search])
      @search.save
      search = Request.ascend_by_deadline.search(:title_like => params[:search][:title], :materials_like => params[:search][:material_tags], :other_tags_like => params[:search][:other_tags], :user_login_like => params[:search][:requester], :deadline_lte => @search.deadline, :request_status_eq => @search.request_status)
      logger.info search
      @requests = search.all #Take all results in the search array
      @number_of_results = @requests.size      
      @requests = @requests.paginate(:per_page => 15, :page => params[:page]).reverse
      @nosearch = 0
     else
      @nosearch = 1
      @requests = Request.request_status_eq("open").paginate(:per_page => 12, :page => params[:page]).reverse
      @search = Search.new
      date = Time.now
      date = date + 4.years
      @search.deadline = date
    end
    @open_requests = Request.request_status_eq("open")
    @all_requests = Request.find(:all)
    
    #Define breadcrumbs
    @l1_link = requests_path
    @l1_name = t("controllers.requests.s1")
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @requests }
      end
  end
  
  def my_requests
    @requests = Request.find(:all,
                             :conditions => ["user_id = ? and request_status = ?", self.current_user.id, "open"])                         
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = "My Account"    
    @l2_link = my_requests_path
    @l2_name = "My Requests" 
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @requests }
    end
  end

def closed_requests
    @requests = Request.find(:all,
                             :conditions => ["user_id = ? and request_status = ?", self.current_user.id, "closed"])                         

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @requests }
    end
  end

  # GET /requests/1
  # GET /requests/1.xml
  def show
    @request = Request.find(params[:id])
    @bids = Bid.find(:all,
                    :conditions => ["request_id = ?", @request.id])
    @bid_id = 0                
    #Define breadcrumbs
    @l1_link = requests_path
    @l1_name = "Wünsche"
    @l2_link = request_path
    @l2_name = "Wunsch " + @request.id.to_s
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/new
  # GET /requests/new.xml
  def new
    @request = Request.new
    
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @request }
    end
  end

  # GET /requests/1/edit
  def edit
    @request = Request.find(params[:id])
     #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = "My Account"
    @l2_link = edit_request_path
    @l2_name = "Edit Request " + @request.id.to_s
  end

  # POST /requests
  # POST /requests.xml
  def create
    @request = Request.new(params[:request])
    @request.user_id = self.current_user.id
    @request.request_status = "open"
    @request.posted_on = Date.today
    @request.expiry_date = @request.posted_on + 30

    respond_to do |format|
      if @request.save
        flash[:notice] = 'Request was successfully created.'
        format.html { redirect_to(@request) }
        format.xml  { render :xml => @request, :status => :created, :location => @request }
      else
          flash[:notice] = 'Error during creation.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /requests/1
  # PUT /requests/1.xml
  def update
    @request = Request.find(params[:id])

    respond_to do |format|
      if @request.update_attributes(params[:request])
        flash[:notice] = 'Request was successfully updated.'
        format.html { redirect_to(@request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def autoclose
    ##Closes requests where expiry date is reached.
    @request = Request.find(:all,
                            :conditions => ["expiry_date <= ? and request_status = ?", Date.today, "open"])
    @request.request_status = "closed"
    
    @bids = Bid.find(:all,
                     :conditions => ["request_id = ?", @request.id])
    for b in @bids                 
      if b.bid_status == "open"
      b.bid_status = "request closed"  
      b.save
      end
    end
    
    respond_to do |format|
      if @request.save 
        format.html { redirect_to my_requests_path() } # ???
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def close
    ##Closes this.
    @request = Request.find(params[:id])
    @request.request_status = "closed"
    
    @bids = Bid.find(:all,
                     :conditions => ["request_id = ?", @request.id])
    for b in @bids                 
      if b.bid_status == "open"
      b.bid_status = "request closed"  
      b.save
      end
    end
    
    respond_to do |format|
      if @request.save 
        format.html { redirect_to my_requests_path() }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.xml
  def destroy
    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
     # format.html { redirect_to(requests_url) }
      format.html { redirect_to closed_requests_path() }
      format.xml  { head :ok }
    end
  end
end

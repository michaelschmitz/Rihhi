class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.xml
  def index
    @searches = Search.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @searches }
    end
  end

  # GET /searches/1
  # GET /searches/1.xml
  def show 
    #compare to this regexpression: "\w+$\i" 
      @listings = Listing.find(:all, 
                              :conditions => ["title like ? and removed = ? and nr_of_items_in_stock >= ? and creation = ?", "%" + params[:asearch]+ "%", "0", 1, "completed"],
                              :limit => 15)
                              
if @g_bids_enabled == 1
      @requests = Request.find(:all, 
                              :conditions => ["title like ?", "%" + params[:asearch]+ "%"],
                              :limit => 15)
end
if @g_events_enabled == 1
      @events = Event.find(:all, 
                              :conditions => ["title like ?", "%" + params[:asearch]+ "%"],
                              :limit => 30)
end
if @g_events_enabled == 1
      @tickets = Ticket.find(:all, 
                              :conditions => ["name like ?", "%" + params[:asearch]+ "%"],
                              :limit => 30)
end                              
      @users = User.find(:all, 
                              :conditions => ["login like ?", "%" + params[:asearch]+ "%"],
                              :limit => 15)
      @term = params[:asearch]
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.xml
  def new
    @search = Search.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @search }
    end
  end

  # GET /searches/1/edit
  def edit
    @search = Search.find(params[:id])
  end

  # POST /searches
  # POST /searches.xml
  def create
    if params[:asearch]
    @results = Ticket.find(params[:asearch])

    end
    respond_to do |format|
      if @search.save
        flash[:notice] = 'Search was successfully created.'
        format.html { redirect_to(@search) }
        format.xml  { render :xml => @search, :status => :created, :location => @search }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /searches/1
  # PUT /searches/1.xml
  def update
    

    respond_to do |format|
      if @search.update_attributes(params[:search])
        flash[:notice] = 'Search was successfully updated.'
        format.html { redirect_to(@search) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @search.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.xml
  def destroy
    @search = Search.find(params[:id])


    respond_to do |format|
      format.html { redirect_to(searches_url) }
      format.xml  { head :ok }
    end
  end
end

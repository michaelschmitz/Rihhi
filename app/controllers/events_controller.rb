class EventsController < ApplicationController
  before_filter :login_required, :except => [:show, :index, :autocomplete_title, :index2]
  protect_from_forgery :except => [:autocomplete_title]
  # GET /events
  # GET /events.xml
  def index    
    if params[:search]
    @search = Search.new(params[:search])
    @search.save
    search = Event.ascend_by_startdate.search(:title_like => params[:search][:event_name], :country_like => params[:search][:country])
    logger.info search
    #Use this @search object only if you know that there is indeed always a startdate. See request for properly doing this.
    search.startdate_gte = @search.startdate
    search.enddate_lte = @search.enddate    
    search.ascend_by_startdate
    @events = search.all 
    @number_of_results = @events.size
    @events = @events.paginate(:per_page => 12, :page => params[:page])
    @nosearch = 0
  else
    @nosearch = 1
    search = Event.ascend_by_startdate.search()
    search.startdate_gte = Date.today
    @events = search.all 
    @events = @events.paginate(:per_page => 12, :page => params[:page])
    @event = Event.new  
    @search = Search.new
    date = Time.now
    date = date.next_month
    @search.enddate = date
  end
   @all_events = Event.find(:all)
    
    #Define breadcrumbs
    @l1_link = events_path
    @l1_name = "Events" 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
   
    end
  end
  
    def index2
    @events = Event.search_index(20, params[:page])
    @all_events = Event.find(:all)
    respond_to do |format|
      format.html # index2.html.erb
      format.xml  { render :xml => @events }
    end
  end


  def autocomplete_title
    @values = Event.find(:all,
                          :select => "title",
                          :conditions => ["title like ? and user_id = ?", params[:event][:title]+ "%", self.current_user.id],
                          :limit => 6 )
                         
    @results = []
    
      for values in @values do
        @results << values.title
      end   
    render :partial => "shared/autocomplete_results", :object => @results
  end
  
  def results    
    if params[:search]
    @search = Search.new(params[:search])
    @search.save
    search = Event.ascend_by_startdate.search(:title_like => params[:search][:event_name], :country_like => params[:search][:country])
    search.startdate_gte = @search.startdate
    search.enddate_lte = @search.enddate    
    search.ascend_by_startdate
    @events = search.all 
    @number_of_results = @events.size
    @events = @events.paginate(:per_page => 5, :page => params[:page])
    end
  end
  
  
  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    @tickets = Ticket.find(:all, :conditions => ["event_id = ?", @event.id])
    @tickets = @tickets.paginate(:per_page => 10, :page => params[:page])
    
    #Define breadcrumbs
    @l1_link = events_path
    @l1_name = "Events"
    @l2_link = event_path
    @l2_name = "Event " + @event.id.to_s
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
  @test = Event.find(:first, :conditions => ["status = ? and user_id = ?", "incomplete", self.current_user.id]) #add search for seller id too  
    if @test != nil
      @event = @test
  #else make a new listing
    else
      @event = Event.new      
      @event.user_id = self.current_user.id #Find the seller based on his id and give it to the listing not sure whether necessary.
      @event.status = "incomplete"
      @event.complete = "step0"
      @event.save  

 
  end
    @l1_link = profile_path
    @l1_name = "My Account"    
    @l2_link = new_event_path
    @l2_name = "New Event (" + @event.id.to_s + ") Step 1 "
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end
  
  def new2  
    @event = Event.find(params[:event_id])
    @event.complete = "step1"
    #Security check missing
    
        #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = "My Account"    
    @l2_link = new_event2_path
    @l2_name = "New Event (" + @event.id.to_s + ") Step 2 "
    respond_to do |format|
      if @event.update_attributes(params[:event])
          format.html #new2.html.erb
          format.xml  { head :ok }
       else
          flash[:notice_bad] = 'Fill in all required fields to proceed.'
          format.html { render :action => "new" }
          format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
       end
   end

  end
  
  def new3
    @event = Event.find(params[:event_id])
    @event.complete = "step2"
    #Security check missing
    
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = "My Account"    
    @l2_link = new_event3_path
    @l2_name = "New Event (" + @event.id.to_s + ") Step 3 "
    
    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html #new3.html.erb
        format.xml  { head :ok }
      else
       flash[:notice_bad] = 'Fill in all required fields to proceed.'
       format.html { render :action => "new2" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new4
    @event = Event.find(params[:event_id])
    @event.complete = "step3"
    #Security check missing
    
     #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = "My Account"    
    @l2_link = new_event4_path
    @l2_name = "New Event (" + @event.id.to_s + ") Step 4 "
    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html #new3.html.erb
        format.xml  { head :ok }
      else
        flash[:notice_bad] = 'Fill in all required fields to proceed.'
        format.html { render :action => "new3" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new5
    @event = Event.find(params[:event_id])
    @event.complete = "step4"    

    #Security check missing
    
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = "My Account"    
    @l2_link = new_event5_path
    @l2_name = "New Event (" + @event.id.to_s + ") Step 5 "
    respond_to do |format|
        if @event.update_attributes(params[:event])
          #Add a link to the forum discussion & create a new post for this event.
          @event.link_to_forum_discussion = "http://www.rihhi.com/forum/events/event" + @event.id.to_s
          @event.save!
         
        flash[:notice] = 'Event was successfully updated.'
        format.html 
        format.xml  { head :ok }
      else
        flash[:notice_bad] = 'Fill in all required fields to proceed.'
        format.html { render :action => "new4" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end
  
    def new6     
    #Update the seller of this user.   
    @event = Event.find(params[:event_id])
    @seller = Seller.find(:first, :conditions => ["user_id = ?", self.current_user.id])
    @event.complete = "step5" 
    if @seller == nil
      @seller = Seller.new
      @seller.user_id = self.current_user.id
      @seller.save
    end
    #Security check missing
    
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = "My Account"    
    @l2_link = events_path
    @l2_name = "New Event " + @event.id.to_s
    respond_to do |format|
      if @seller.update_attributes(params[:seller])
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to @event}
        format.xml  { head :ok }
      else
        logger.info @seller.errors.inspect
        format.html { render :action => "new5" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = "My Account"    
    @l2_link = events_path
    @l2_name = "Edit Event " + @event.id.to_s 
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
end

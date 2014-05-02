class TicketsController < ApplicationController
  before_filter :login_required, :except => [:show, :index]
  # GET /tickets
  # GET /tickets.xml
  def index
    if params[:search]
    @search = Search.new(params[:search])
    search = Ticket.ascend_by_event_title.search(:name_like => params[:search][:title], :event_title_like => params[:search][:event_name] )  
    search.valid_from_gte = @search.startdate
    search.valid_until_lte = @search.enddate     
    @tickets = search.all     
    @number_of_results = @tickets.size
    #Will paginate has to be used on the @tickets object, not on the local search objects above!
    @tickets = @tickets.paginate(:page => params[:page])
    @nosearch = 0
  else
    @nosearch = 1
    @tickets = Ticket.search_index(12, params[:page])   
    @search = Search.new
    date = Time.now
    date = date.next_month
    @search.enddate = date

  end
  @all_tickets = Event.find(:all)
  
     #Define breadcrumbs
    @l1_link = tickets_path
    @l1_name = "Tickets"       

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = Ticket.find(params[:id])
    @tickets = Ticket.find(:all, :conditions => ["event_id = ?", @ticket.event_id])
    @tickets = @tickets.paginate(:page => params[:page])
    
    #Define breadcrumbs
    @l1_link = tickets_path
    @l1_name = "Tickets"    
    @l2_link = ticket_path
    @l2_name = "Ticket " + @ticket.id.to_s
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @events = Event.find(:all, :conditions => ["user_id = ?", self.current_user.id])
    @ticket = Ticket.new
    @ticket.event_id = params[:ticket][:event_id]

    respond_to do |format|
      if @events.length >= 1
        format.html # new.html.erb
        format.xml  { render :xml => @ticket }
      else
        format.html { redirect_to new_event_path()}
      end
    end    
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end
  
    # GET /tickets/1/edit
  def remote_edit
    @ticket = Ticket.find(params[:id])
    @field_id = params[:field_id]
    flash[:notice] = 'Edit this ticket.'
    render :partial => "events/edit_ticket", :object => @ticket, :object => @field_id
  end
  
    def remote_edit_with_deals
    @ticket = Ticket.find(params[:id])
    @field_id = params[:field_id]
    flash[:notice] = 'Edit this ticket.'
    render :partial => "events/edit_ticket_with_deals", :object => @ticket, :object => @field_id
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    @ticket = Ticket.new(params[:ticket])

  
  #Security check. You can only add a ticket for an event you also created!´
  
    respond_to do |format|
      if @ticket.save
        flash[:notice] = 'Ticket was successfully created.'
        format.html { redirect_to tickets_path() }
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        flash[:notice_bad] = 'Please fill in all required fields.'
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def remote_create
    @ticket = Ticket.new(params[:ticket])
    @event = Event.find(@ticket.event_id)
    if self.current_user.is_seller?
      @ticket.seller_id = self.current_user.seller.id
    end
    
    respond_to do |format|
      if @ticket.save
        flash[:notice] = 'Ticket was successfully created.'
        format.html { render :partial => "events/old_tickets", :object => @event  }
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        flash[:notice] = 'Please fill in all needed fields.'
        logger.info("Save failed. Rendering tickets partial")
        format.html { render :partial => "events/old_tickets", :object => @event , :object => @ticket }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        flash[:notice] = 'Ticket was successfully updated.'
        format.html { redirect_to(@ticket) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end
  
   # PUT /tickets/1
  # PUT /tickets/1.xml
  def remote_update
    @ticket = Ticket.find(params[:id])
    @event = Event.find(@ticket.event_id)
    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        flash[:notice] = 'Ticket was successfully updated.'
        format.html { render :partial => "events/old_tickets", :object => @event  }
        format.xml  { head :ok }
      else
        logger.info("Save failed. Rendering tickets partial")
        format.html { render :partial => "events/old_tickets", :object => @event , :object => @ticket }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def remote_update_with_deals
    @ticket = Ticket.find(params[:id])
    @event = Event.find(@ticket.event_id)
    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        flash[:notice] = 'Ticket was successfully updated.'
        format.html { render :partial => "events/old_tickets_with_deals", :object => @event  }
        format.xml  { head :ok }
      else
        logger.info("Save failed. Rendering tickets partial")
        format.html { render :partial => "events/old_tickets_with_deals", :object => @event , :object => @ticket }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to(tickets_url) }
      format.xml  { head :ok }
    end
  end
end

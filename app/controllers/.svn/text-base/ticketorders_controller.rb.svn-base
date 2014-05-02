class TicketordersController < ApplicationController
  # GET /ticketorders
  # GET /ticketorders.xml
  def index
    @ticketorders = Ticketorder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ticketorders }
    end
  end

  # GET /ticketorders/1
  # GET /ticketorders/1.xml
  def show
    @ticketorder = Ticketorder.find(params[:id])
    @seller = Seller.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticketorder }
    end
  end

  # GET /ticketorders/new
  # GET /ticketorders/new.xml
  def new
    @ticketorder = Ticketorder.new
    @ticketorder.ticket_id = params[:order][:ticket_id]
    @ticketorder.step = "step0"
    @ticketorder.vendor_id = @ticketorder.ticket.seller_id
    if self.logged_in?
      @ticketorder.user_id = self.current_user.id
    end
    logger.info(@ticketorder.ticket.seller_id)
    logger.info(@ticketorder.vendor_id)
    @ticketorder.save
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticketorder }
    end
  end
  
  def new2
   @ticketorder = Ticketorder.find(params[:ticketorders_id])
   @ticketorder.step = "step1"
    if Date.today <= @ticketorder.ticket.price1_deadline
      @ticketorder.ticket_price = @ticketorder.ticket.price1 
            logger.info @ticketorder.ticket.price1
    elsif Date.today <= @ticketorder.ticket.price2_deadline
      @ticketorder.ticket_price =  @ticketorder.ticket.price2
    elsif Date.today <= @ticketorder.ticket.price3_deadline
      @ticketorder.ticket_price =  @ticketorder.ticket.price3
    elsif Date.today <= @ticketorder.ticket.price4_deadline
      @ticketorder.ticket_price = @ticketorder.ticket.price4
    else
      @ticketorder.ticket_price = @ticketorder.ticket.price5
      logger.info @ticketorder.ticket_price.to_s + "price"
    end
    
    @ticketorder.total_price = @ticketorder.ticket_price * @ticketorder.nr_of_tickets
    respond_to do |format|
      if @ticketorder.update_attributes(params[:ticketorder])
        flash[:notice] = 'Step 1 complete. '
        format.html 
        format.xml  { render :xml => @ticketorder, :status => :created, :location => @ticketorder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticketorder.errors, :status => :unprocessable_entity }
      end
    end
  end
 

  # GET /ticketorders/1/edit
  def edit    
    @ticketorder = Ticketorder.find(params[:id])
  end

  # POST /ticketorders
  # POST /ticketorders.xml
  def create
    @ticketorder = Ticketorder.new(params[:ticketorder])
    #Take the current date
    @now = Date.today
    #Take the price that still applies
    #Multiply price time nr of tickets
    #Save as Total_Price
    #...
    respond_to do |format|
      if @ticketorder.save
        flash[:notice] = 'Ticketorder was successfully created.'
        format.html { redirect_to(@ticketorder) }
        format.xml  { render :xml => @ticketorder, :status => :created, :location => @ticketorder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticketorder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ticketorders/1
  # PUT /ticketorders/1.xml
  def update
    @ticketorder = Ticketorder.find(params[:id])

    respond_to do |format|
      if @ticketorder.update_attributes(params[:ticketorder])
        flash[:notice] = 'Ticketorder was successfully updated.'
        format.html { redirect_to(@ticketorder) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticketorder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ticketorders/1
  # DELETE /ticketorders/1.xml
  def destroy
    @ticketorder = Ticketorder.find(params[:id])
    @ticketorder.destroy

    respond_to do |format|
      format.html { redirect_to(ticketorders_url) }
      format.xml  { head :ok }
    end
  end
end

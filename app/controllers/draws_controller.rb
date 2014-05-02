class DrawsController < ApplicationController
  # GET /draws
  # GET /draws.xml
  def index
    page = params[:page] || 1
    @draws = Draw.paginate(:page => page, :per_page => 50, :order => 'id DESC')
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @draws }
    end
  end

  #Confirm a draw, exact amount debited as was on "balance now"
  def confirm
    @draw = Draw.find(params[:id])
    #Create a movement for the seller
    @value = @draw.balance_now 
    @movement = Movement.new
    @movement.code = 4
    @movement.reason = t("controllers.carts.s1") + @value.to_s + t("controllers.carts.s2")
    @movement.value = @value
    @movement.email = 0
    @movement.dispute = 0    
    @movement.seller_id = @draw.seller_id
    @movement.save
    #Change account balance of seller
    @seller = Seller.find(@draw.seller_id)
    @seller.account_balance -= @value
    @seller.last_account_balance = @value
    @seller.seller_status = "0"
    @seller.save        
    #Change the draw to confirmed
    @draw.debited = @draw.balance_now
    @draw.save
    @user = @seller.user
    #Send email
    SystemMailer.deliver_movement2(@seller, @user, @draw)
    #Show index again and flash message (Confirmed draw)6 
    respond_to do |format|
      format.html { redirect_to(draws_url) }      
    end
  end
  
  #Could not draw the balance from the sellers bank account
  def failure
    @draw = Draw.find(params[:id])
    #Create a movement for the seller
    @value = @draw.balance_now 
    @movement = Movement.new
    @movement.code = 5
    @movement.reason = t("controllers.carts.s3") + @value.to_s + t("controllers.carts.s4")
    @movement.value = @value
    @movement.email = 1
    @movement.dispute = 0    
    @movement.seller_id = @draw.seller_id
    @movement.save
            
    #Change the seller account to "outstanding payment"
    @seller = Seller.find(@draw.seller_id)
    @seller.account_balance += 9.00
    @seller.seller_status = "1"   #Seller Status 1 = Payment outstanding
    @seller.save
    @draw.fail = "Draw failed"
    @draw.save
    @user = @seller.user
    SystemMailer.deliver_movement3(@seller, @user, @draw)      

    #Show index again and flash message (Confirmed draw)6 
    respond_to do |format|
      format.html { redirect_to(draws_url) }      
    end
  end

  # GET /draws/1
  # GET /draws/1.xml
  def show
    @draw = Draw.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @draw }
    end
  end

  # GET /draws/new
  # GET /draws/new.xml
  #Create a list of new draws and save it. Once 
  def new
    #Select all account balances from current sellers.
    @sellers = Seller.find(:all, :conditions => ["account_balance >= ? and electronic_direct_debit = ?", 0.4, "Yes"])
    #Select an existing draw with the highest number (highest id, order id DESC), take this list number and increase by 1
    @latest = Draw.find(:first, :order => 'id DESC') 
    if @latest == nil
      @latest.list = 1
    end
    #Create a new draw for each seller
    @sellers.each do |s|
      @draw = Draw.new
      @draw.list = (@latest.list + 1) # This number should be one higher than for the last batch of draws
      @draw.seller_id = s.id
      @draw.balance_now = s.account_balance
      @draw.login_name = s.user.login
      @draw.name = s.full_name
      @draw.account_holder = s.account_holder_name
      @draw.iban = s.account_number
      @draw.bic = s.bank_identifier
      @draw.debited = 0.00
      @draw.difference = 0
      @draw.fail = 0    
      @draw.save
    end
    #Show me the newly created draws
    @draws = Draw.find(:all, :conditions => ["list = ?", @latest.list + 1])
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @draw }
    end
  end

  # GET /draws/1/edit
  def edit
    @draw = Draw.find(params[:id])
  end

  # POST /draws
  # POST /draws.xml
  def create
    @draw = Draw.new(params[:draw])

    respond_to do |format|
      if @draw.save
        format.html { redirect_to(@draw, :notice => 'Draw was successfully created.') }
        format.xml  { render :xml => @draw, :status => :created, :location => @draw }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @draw.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /draws/1
  # PUT /draws/1.xml
  def update
    @draw = Draw.find(params[:id])

    respond_to do |format|
      if @draw.update_attributes(params[:draw])
        format.html { redirect_to(@draw, :notice => 'Draw was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @draw.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /draws/1
  # DELETE /draws/1.xml
  def destroy
    @draw = Draw.find(params[:id])
    flash[:notice_bad] = "Draws can not be deleted."

    respond_to do |format|
      format.html { redirect_to(draws_url) }
      format.xml  { head :ok }
    end
  end
end

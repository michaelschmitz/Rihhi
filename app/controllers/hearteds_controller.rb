class HeartedsController < ApplicationController
  # GET /hearteds
  # GET /hearteds.xml
  def index
    page = params[:page] || 1
    @hearteds = Hearted.paginate(:page => page,
                             :conditions => ["user_id = ?", self.current_user.id])
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.hearteds.s1")
    @l2_link = ""
    @l2_name = t("controllers.hearteds.s2")                     
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hearteds }
    end
  end

  # GET /hearteds/1
  # GET /hearteds/1.xml
  def show
    @hearted = Hearted.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @hearted }
    end
  end

  # GET /hearteds/new
  # GET /hearteds/new.xml
  def new
    @hearted = Hearted.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hearted }
    end
  end

  # GET /hearteds/1/edit
  def edit
    @hearted = Hearted.find(params[:id])
  end

  # POST /hearteds
  # POST /hearteds.xml
  def create
    @hearted = Hearted.new
    @hearted.listing_id = (params[:listing_id])
    @hearted.user_id = (params[:user_id])
    @listing = Listing.find(:first,
                            :conditions => ["id = ?", @hearted.listing_id])

    respond_to do |format|
      if @hearted.save
        format.html { redirect_to(@listing) }
        format.xml  { render :xml => @hearted, :status => :created, :location => @hearted }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hearted.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hearteds/1
  # PUT /hearteds/1.xml
  def update
    @hearted = Hearted.find(params[:id])

    respond_to do |format|
      if @hearted.update_attributes(params[:hearted])
        flash[:notice] = 'Hearted was successfully updated.'
        format.html { redirect_to(@hearted) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hearted.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hearteds/1
  # DELETE /hearteds/1.xml
  def destroy
    @hearted = Hearted.find(params[:id])
    @listing = Listing.find(:first,
                            :conditions => ["id = ?", @hearted.listing_id])
    @hearted.destroy

    respond_to do |format|
      format.html { redirect_to(@listing) }
      format.xml  { head :ok }
    end
  end
end

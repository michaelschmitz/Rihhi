class FlaggedsController < ApplicationController
  # GET /flaggeds
  # GET /flaggeds.xml
  def index
    @flaggeds = Flagged.find(:all,
                             :conditions => ["user_id = ? and deleted = ?", self.current_user.id, "yes"])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flaggeds }
    end
  end

  # GET /flaggeds/1
  # GET /flaggeds/1.xml
  def show
    @flagged = Flagged.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flagged }
    end
  end

  # GET /flaggeds/new
  # GET /flaggeds/new.xml
  def new
    @flagged = Flagged.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flagged }
    end
  end

  # GET /flaggeds/1/edit
  def edit
    @flagged = Flagged.find(params[:id])
  end

  # POST /flaggeds
  # POST /flaggeds.xml
  def create
    @flagged = Flagged.new(params[:flaggeds])
    @listing = Listing.find(:first,
                            :conditions => ["id = ?", @flagged.listing_id])
    
    respond_to do |format|
      if @flagged.save
        flash[:notice_good] = t("controllers.flaggeds.s1")
        format.html { redirect_to(@listing) }
        format.xml  { render :xml => @flagged, :status => :created, :location => @flagged }
      else
        flash[:notice_bad] = t("controllers.flaggeds.s2")
        format.html { redirect_to(@listing) }
        format.xml  { render :xml => @flagged.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flaggeds/1
  # PUT /flaggeds/1.xml
  def update
    @flagged = Flagged.find(params[:id])

    respond_to do |format|
      if @flagged.update_attributes(params[:flagged])
        flash[:notice] = 'Flagged was successfully updated.'
        format.html { redirect_to(@flagged) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flagged.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flaggeds/1
  # DELETE /flaggeds/1.xml
  def destroy
    @flagged = Flagged.find(params[:id])
    @flagged.destroy

    respond_to do |format|
      format.html { redirect_to(flaggeds_url) }
      format.xml  { head :ok }
    end
  end
end

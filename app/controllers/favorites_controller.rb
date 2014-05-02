class FavoritesController < ApplicationController
  # GET /favorites
  # GET /favorites.xml
  def index
    page = params[:page] || 1
    @favorites = Favorite.paginate(:page => page,
                              :conditions => ["user_id = ?", self.current_user.id])
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.favorites.s1")
    @l2_link = ""
    @l2_name = t("controllers.favorites.s2")
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favorites }
    end
  end

  # GET /favorites/1
  # GET /favorites/1.xml
  def show
    @favorites = Favorite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @favorites }
    end
  end

  # GET /favorites/new
  # GET /favorites/new.xml
  def new
    @favorites = Favorite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @favorites }
    end
  end

  # GET /favorites/1/edit
  def edit
    @favorites = Favorites.find(params[:id])
  end

  # POST /favorites
  # POST /favorites.xml
  def create
    @favorites = Favorite.new
    @favorites.listing_id = (params[:listing_id])      
    @favorites.user_id = (params[:user_id])      
    @listing = Listing.find(:first,
                            :conditions => ["id = ?", @favorites.listing_id])
    respond_to do |format|
      if @favorites.save
        format.html { redirect_to(@listing) }
       # format.html { redirect_to(@favorites) }
        format.xml  { render :xml => @favorites, :status => :created, :location => @favorites }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @favorites.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /favorites/1
  # PUT /favorites/1.xml
  def update
    @favorites = Favorites.find(params[:id])

    respond_to do |format|
      if @favorites.update_attributes(params[:favorites])
        flash[:notice] = 'Favorites was successfully updated.'
        format.html { redirect_to(@favorites) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @favorites.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.xml
  def destroy
    @favorites = Favorite.find(params[:id])
    @listing = Listing.find(:first,
                            :conditions => ["id = ?", @favorites.listing_id])
    @favorites.destroy

    respond_to do |format|
      format.html { redirect_to(@listing) }
      format.xml  { head :ok }
    end
  end
end

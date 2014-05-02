class UserpagesController < ApplicationController
  # GET /userpages
  # GET /userpages.xml
  def index
    @userpages = Userpage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @userpages }
    end
  end

  # GET /userpages/1
  # GET /userpages/1.xml
  def show
    @userpage = Userpage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @userpage }
    end
  end

  # GET /userpages/new
  # GET /userpages/new.xml
  def new
    @userpage = Userpage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @userpage }
    end
  end

  # GET /userpages/1/edit
  def edit
    @userpage = Userpage.find(params[:id])
    
            #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.userpages.s1")
    @l2_link = ""
    @l2_name = t("controllers.userpages.s2")
  end

  # POST /userpages
  # POST /userpages.xml
  def create
    @userpage = Userpage.new(params[:userpage])

    respond_to do |format|
      if @userpage.save
        format.html { redirect_to(@userpage, :notice => 'Userpage was successfully created.') }
        format.xml  { render :xml => @userpage, :status => :created, :location => @userpage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @userpage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /userpages/1
  # PUT /userpages/1.xml
  def update
    @userpage = Userpage.find(params[:id])
    @user = User.find(self.current_user.id)
    respond_to do |format|
      if @userpage.update_attributes(params[:userpage])
        format.html { redirect_to(@user, :notice => t("controllers.userpages.s3")) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @userpage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /userpages/1
  # DELETE /userpages/1.xml
  def destroy
    @userpage = Userpage.find(params[:id])
    

    respond_to do |format|
      format.html { redirect_to(userpages_url) }
      format.xml  { head :ok }
    end
  end
end

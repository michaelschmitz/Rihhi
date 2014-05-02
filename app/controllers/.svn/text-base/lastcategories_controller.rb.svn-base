class LastcategoriesController < ApplicationController
  # GET /lastcategories
  # GET /lastcategories.xml
  def index
    @lastcategories = Lastcategory.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lastcategories }
    end
  end

  # GET /lastcategories/1
  # GET /lastcategories/1.xml
  def show
    @lastcategory = Lastcategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lastcategory }
    end
  end

  # GET /lastcategories/new
  # GET /lastcategories/new.xml
  def new
    @lastcategory = Lastcategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lastcategory }
    end
  end

  # GET /lastcategories/1/edit
  def edit
    @lastcategory = Lastcategory.find(params[:id])
  end

  # POST /lastcategories
  # POST /lastcategories.xml
  def create
    @lastcategory = Lastcategory.new(params[:lastcategory])

    respond_to do |format|
      if @lastcategory.save
        flash[:notice] = 'Lastcategory was successfully created.'
        format.html { redirect_to(@lastcategory) }
        format.xml  { render :xml => @lastcategory, :status => :created, :location => @lastcategory }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lastcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lastcategories/1
  # PUT /lastcategories/1.xml
  def update
    @lastcategory = Lastcategory.find(params[:id])

    respond_to do |format|
      if @lastcategory.update_attributes(params[:lastcategory])
        flash[:notice] = 'Lastcategory was successfully updated.'
        format.html { redirect_to(@lastcategory) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lastcategory.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lastcategories/1
  # DELETE /lastcategories/1.xml
  def destroy
    @lastcategory = Lastcategory.find(params[:id])
    @lastcategory.destroy

    respond_to do |format|
      format.html { redirect_to(lastcategories_url) }
      format.xml  { head :ok }
    end
  end
end

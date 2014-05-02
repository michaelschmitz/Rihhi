class SizesController < ApplicationController
  # GET /sizes
  # GET /sizes.xml
  def index
    @sizes = Sizes.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sizes }
    end
  end

  # GET /sizes/1
  # GET /sizes/1.xml
  def show
    @sizes = Sizes.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sizes }
    end
  end

  # GET /sizes/new
  # GET /sizes/new.xml
  def new
    @sizes = Sizes.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sizes }
    end
  end

  # GET /sizes/1/edit
  def edit
    @sizes = Sizes.find(params[:id])
  end

  # POST /sizes
  # POST /sizes.xml
  def create
    @sizes = Sizes.new(params[:sizes])

    respond_to do |format|
      if @sizes.save
        flash[:notice] = 'Sizes was successfully created.'
        format.html { redirect_to(@sizes) }
        format.xml  { render :xml => @sizes, :status => :created, :location => @sizes }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sizes.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sizes/1
  # PUT /sizes/1.xml
  def update
    @sizes = Sizes.find(params[:id])

    respond_to do |format|
      if @sizes.update_attributes(params[:sizes])
        flash[:notice] = 'Sizes was successfully updated.'
        format.html { redirect_to(@sizes) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sizes.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sizes/1
  # DELETE /sizes/1.xml
  def destroy
    @sizes = Sizes.find(params[:id])
    @sizes.destroy

    respond_to do |format|
      format.html { redirect_to(sizes_url) }
      format.xml  { head :ok }
    end
  end
end

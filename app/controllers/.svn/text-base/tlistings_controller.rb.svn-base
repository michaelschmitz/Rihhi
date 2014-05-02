class TlistingsController < ApplicationController
  # GET /tlistings
  # GET /tlistings.xml
  def index
    @tlistings = Tlisting.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tlistings }
    end
  end

  # GET /tlistings/1
  # GET /tlistings/1.xml
  def show
    @tlisting = Tlisting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tlisting }
    end
  end

  # GET /tlistings/new
  # GET /tlistings/new.xml
  def new
    @tlisting = Tlisting.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tlisting }
    end
  end

  # GET /tlistings/1/edit
  def edit
    @tlisting = Tlisting.find(params[:id])
  end

  # POST /tlistings
  # POST /tlistings.xml
  def create
    @tlisting = Tlisting.new(params[:tlisting])

    respond_to do |format|
      if @tlisting.save
        flash[:notice] = 'Tlisting was successfully created.'
        format.html { redirect_to(@tlisting) }
        format.xml  { render :xml => @tlisting, :status => :created, :location => @tlisting }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tlisting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tlistings/1
  # PUT /tlistings/1.xml
  def update
    @tlisting = Tlisting.find(params[:id])

    respond_to do |format|
      if @tlisting.update_attributes(params[:tlisting])
        flash[:notice] = 'Tlisting was successfully updated.'
        format.html { redirect_to(@tlisting) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tlisting.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tlistings/1
  # DELETE /tlistings/1.xml
  def destroy
    @tlisting = Tlisting.find(params[:id])
    @tlisting.destroy

    respond_to do |format|
      format.html { redirect_to(tlistings_url) }
      format.xml  { head :ok }
    end
  end
end

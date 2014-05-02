class MovementsController < ApplicationController
  # GET /movements
  # GET /movements.xml
  def index
    page = params[:page] || 1
    @movements = Movement.paginate(:page => page, :per_page => 15, :conditions => ["seller_id = ?", self.current_user.seller.id], :order => 'id DESC')


    @seller = Seller.find(self.current_user.seller.id)
    
    #Define breadcrumbs
    @l1_link = profile_path
    @l1_name = t("controllers.movements.s1")  
    @l2_link = shippingpresets_path 
    @l2_name = t("controllers.movements.s2")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movements }
    end
  end

 
end

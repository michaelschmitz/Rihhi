class CartsController < ApplicationController
  before_filter :login_required, :except => [:add, :remove]
  
  def add
    @listing = Listing.find(params[:listing_id])
    @size = params[:size] || "0"
    @color = params[:color] || "0"   
    
    @listing.nr_of_items_in_stock -= 1
    if @listing.nr_of_items_in_stock <= 0
      @listing.nr_of_items_in_stock = 0  
    end
    @listing.save
    
    if request.post?
      @item = @cart.add(@listing.id, @size, @color)
      flash[:notice_good] = t("controllers.carts.s1") + "<em>#{@item.listing.title}</em>"
      redirect_to(:controller => "carts", :action => "show")
      #redirect_to :controller => "catalog"
    else
      render
    end
  end


  def remove
    @listing = Listing.find(params[:listing_id])
    @size = params[:size] || "0"
    @color = params[:color] || "0"
    
    @listing.nr_of_items_in_stock += 1
    @listing.save
    if request.post?
      @item = @cart.remove(@listing.id, @size, @color )
      flash[:notice_good] = t("controllers.carts.s2") + "<em>#{@item.listing.title}</em>"
      redirect_to(:controller => "carts", :action => "show")
      #redirect_to :controller => "catalog"
    else
      render
    end
  end
  
  def clear
      #Reset listings.nr_of_items_in_stock by adding the numbers we had in the cart
      @cart.cart_items.each do |c|
        l = c.listing
        l.nr_of_items_in_stock += c.amount
        l.save
      end        
      #Then destroy items
      @cart.cart_items.destroy_all
      flash[:notice_good] = t("controllers.carts.s3")
      redirect_to :controller => "site"
  end

  def show
    @order = Order.new
  end

end

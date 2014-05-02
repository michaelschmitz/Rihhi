class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :listings, :through => :cart_items
  
  def total
    cart_items.inject(0) {|sum, n| n.price * n.amount + sum}
  end
  
  def add(listing_id, size, color)   
    items = cart_items.find_all_by_listing_id(listing_id)
    listing = Listing.find(listing_id)
    if items.size < 1
      #Take the params into account! Size and Colors should be saved in the cart_item as well. Then copied into the deliverable!      
      ci = cart_items.create(:listing_id => listing_id, :amount => 1, :price => listing.price, :size => size , :color => color)
    else
      #If you can find an item that already has the same size and color, increase the amount by one! Else, create a new one as above!
      logger.info(listing_id)
      logger.info(size)
      logger.info(color)      
      ci = cart_items.find(:first, :conditions => ["listing_id = ? and size = ? and color = ?", listing_id, size, color])
      if ci != nil
        ci.update_attribute(:amount, ci.amount + 1)
      else
        ci = cart_items.create(:listing_id => listing_id, :amount => 1, :price => listing.price, :size => size , :color => color)
      end
    end
    ci
  end
  
  def remove(listing_id, size, color)
    #Insert the same code as used above to remove the proper item! Simply match by size and color.
    ci = cart_items.find(:first, :conditions => ["listing_id = ? and size = ? and color = ?", listing_id, size, color])
    #What happens if a user types some url manually with wrong information? What kind of error message does he get?
    if ci.amount > 1
      ci.update_attribute(:amount, ci.amount - 1)
    else
      CartItem.destroy(ci.id)
    end
    return ci
  end

end

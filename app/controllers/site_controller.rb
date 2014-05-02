class SiteController < ApplicationController
  def index
    @title = "Rihhi - The World's number 1 LRP Portal"
    page = params[:page] || 1
    #Smart to find first, then paginate the results. Allows me to use my limit option.
    @lit = Listing.find(:all, :limit => 30, :conditions => ["nr_of_items_in_stock >= ? and removed = ? and creation = ?", 0, "0", "completed"], :order => 'id DESC' )
    @listings = @lit.paginate(:page => page, :per_page => 12)
    
    if @g_events_enabled == 1
    @number_of_events_total = Event.find(:all)
    @number_of_events_total = @number_of_events_total.length 
  
 
    search = Event.search
    search.startdate_like = Date.today
 
    @number_of_events_today = search.all 
    @number_of_events_today = @number_of_events_today.length
#    @listings = @test.reverse
    end
  end
  
  def about
    @title = t("controllers.site.s1")
  end
  
  def tos
    #Breadcrumbs
    @l1_link = tos_path
    @l1_name = t("controllers.site.s2")
    @title = t("controllers.site.s2")
  end
  
  def help
    @title = t("controllers.site.s3")
  end
end
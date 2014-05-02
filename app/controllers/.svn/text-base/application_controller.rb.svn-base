# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :initialize_cart
  before_filter :set_locale
  before_filter :global_setup
  

  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :except => [:autocomplete_search] # :secret => 'cffe9e3b74691d439fa62b3e3d43c1f16'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
   filter_parameter_logging :password
 
  def global_setup
    @captcha_enabled = 0  #New users need to enter a recaptcha to sign up? 1 is yes, 0 no.
    
    @g_bids_enabled = 0       #Are bids visible? 1 = Yes, 0 = No
    @g_events_enabled = 0     #Are events visible? 1 = Yes, 0 = No
    @g_tickets_enabled = 0    #Are tickets visible? 1 = Yes, 0 = No
    @g_community_enabled = 0  #Is the community visible? 1 = Yes, 0 = No
    @g_advertising_enabled = 0 #Is advertising possible & visible? 1 = Yes, 0 = No
    
    @g_bonus_enabled = 1 #Is advertising possible & visible? 1 = Yes, 0 = No
    @mails_enabled = 0
  end
  
 
   def autocomplete_search
   if params[:asearch]
      @values = Listing.find(:all, 
                              :conditions => ["title like ? and removed = ? and nr_of_items_in_stock >= ? and creation = ?", params[:asearch] + "%", "0", 1, "completed"],
                              :limit => 4)
      @results = []
      for values in @values do
        
        @results << values.title
      end
        ############################
      @values = Request.find(:all, 
                              :conditions => ["title like ?", params[:asearch]+ "%"],
                              :limit => 4)
      for values in @values do
        
        @results << values.title
      end
      ############################
      @values = Event.find(:all, 
                              :conditions => ["title like ?", params[:asearch]+ "%"],
                              :limit => 4)
      for values in @values do
        
        @results << values.title
      end
      ############################
      @values = Ticket.find(:all, 
                              :conditions => ["name like ?", params[:asearch]+ "%"],
                              :limit => 4)
      for values in @values do
        
        @results << values.name
      end
       ############################                        
      @values = User.find(:all, 
                              :conditions => ["login like ?", params[:asearch]+ "%"],
                              :limit => 4)
      for values in @values do
        @results << values.login
      end
      render :partial => "shared/autocomplete_results", :object => @results               
    end
    end
    

 
  
  protected
  def set_locale
    session[:locale] = params[:locale] if params[:locale]
    I18n.locale = session[:locale] || "en" #"I18n.default_locale"
    locale_path = "#{LOCALES_DIRECTORY}#{I18n.locale}.yml"
    unless I18n.load_path.include? locale_path
      I18n.load_path << locale_path
      I18n.backend.send(:init_translations)      
    end
    
  rescue Exception => err
    logger.error err
    flash.now[:notice] = "#{I18n.locale} " + t("controllers.application.s1")
    
    I18n.load_path -= [locale_path]
    I18n.locale - session[:locale] = I18n.default_locale
  end

  
  private
  
  def initialize_cart
      if session[:cart_id]
        if Cart.exists?(session[:cart_id])
          @cart = Cart.find(session[:cart_id])
        else
          @cart = Cart.create
          session[:cart_id] = @cart.id
        end
      else
        @cart = Cart.create
        session[:cart_id] = @cart.id
      end
  end

end

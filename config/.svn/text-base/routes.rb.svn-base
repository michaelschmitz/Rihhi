ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resource :session

  map.resources :friends

  map.resources :userpages

  map.resources :draws

  map.resources :movements

  map.resources :ticketorders

  map.resources :searches

  map.resources :tlistings

  map.resources :tickets

  map.resources :events

  map.resources :ratings

  map.resources :messages

  map.resources :sizes

  map.resources :colors

  map.resources :bids

  map.resources :requests

  map.resources :flaggeds

  map.resources :hearteds

  map.resources :favorites

  map.resources :items

  map.resources :deliverables

  map.resources :orders
  
  map.resources :feedbacks

  map.resources :lastcategories

  map.resources :subcategories

  map.resources :categories

  map.resources :shops

  #map.resources :lists

  map.resources :listings

  map.resources :sellers
  
  map.resources :users
  
  map.resource :site
  
  map.resource :profile
    
  map.resource :session
  
  map.resources :sellers, :has_many => [ :listings ]
  
  map.resources :listings, :has_many => [ :carts ]
  map.resources :listings, :has_many => [ :cart_items ]
  
  map.resources :cart_items, :has_one => :cart
  map.resources :cart_items, :has_one => :listing
  
  map.resources :carts, :has_many => [ :cart_items ]
  map.resources :carts, :has_many => [ :listings ]
  
  map.resources :carts, :member => { :add => :any }
  map.resources :carts, :member => { :remove => :any }
  map.resources :carts, :member => { :clear => :any }
  
  map.resources :users, :has_many => [ :lists ]
  
  map.resources :lists do |list|
    list.resources :lists_listings
  end    

  
  map.resources :users do |user|
    user.resources :lists do |list|
      list.resources :lists_listings
    end    
  end
    
  # The priority is based upon order of creation: first created -> highest priority.
  #map.connect 'profile/:screen_name', :controller => 'profile', :action => 'show'

  # Sample of regular route:
  map.connect '', :controller => 'site'
  #map.connect '', :controller => 'profile'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.forgot '/forgot', :controller => 'users', :action => 'forgot'
  map.resend_info '/resend_info', :controller => 'users', :action => 'resend_info'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.about '/about', :controller => 'site', :action => 'about'
  map.help '/help', :controller => 'site', :action => 'help'
  map.profile '/profile', :controller => 'users', :action => 'show'
  map.myitems '/myitems', :controller => 'profiles', :action => 'myitems'
  map.account '/user', :controller => 'users', :action => 'show'
  map.user_edit1 '/user_description', :controller => 'users', :action => 'edit1'
  map.test 'test', :controller => 'profiles', :action => 'show'
  map.tos 'tos', :controller => 'site', :action => 'tos'
  
  #Friends
  map.update1 'accept',  :controller => 'friends',      :action => 'update1',     :method => :get
  map.update2 'ignore',  :controller => 'friends',      :action => 'update2',     :method => :get

  #The "settings" routes
  map.settings 'settings', :controller => 'profiles', :action => 'settings', :method => :get
  map.sellersettings '/sellersettings', :controller => 'sellers', :action => 'edit'  
  map.shopsettings '/shopsettings', :controller => 'shops', :action => 'edit'  
  map.shippingpresets '/shipping_presets', :controller => 'shops', :action => 'shipping_presets'
  map.paymentoptions '/payment_options', :controller => 'shops', :action => 'payment_options'
  
  #The profile routes
  map.out_of_stock 'out_of_stock',       :controller => 'listings', :action => 'index4', :path_prefix => "/seller/:seller_id"
  map.my_requests 'my_requests',         :controller => 'requests', :action => 'my_requests'
  map.closed_requests 'closed_requests', :controller => 'requests', :action => 'closed_requests'
  map.sentmail 'sentmail',               :controller => 'messages', :action => 'sentmail'
  
    #The email routes
    map.answer 'answer', :controller => 'messages',        :action => 'answer'
  
  #LISTINGS
  #Additional
  map.listing_overview 'listing_overview', :controller => 'listings', :action => 'index3', :method => :get
  
  #The "new listing in 5 steps" routes
  map.categories 'categories', :controller => 'listings', :action => 'categories',:path_prefix => "/seller/:seller_id/listing/:listing_id", :method => :get
  map.specifics 'specifics', :controller => 'listings',   :action => 'specifics', :path_prefix => "/seller/:seller_id/listing/:listing_id", :method => :put
  map.shipping 'shipping', :controller => 'listings',     :action => 'shipping',  :path_prefix => "/seller/:seller_id/listing/:listing_id", :method => :put
  map.images 'images', :controller => 'listings',         :action => 'images',    :path_prefix => "/seller/:seller_id/listing/:listing_id", :method => :put
  map.complete 'complete', :controller => 'listings',     :action => 'complete',  :path_prefix => "/seller/:seller_id/listing/:listing_id", :method => :put
  
  #The 5 steps listing/edit routes
  map.title 'title',  :controller => 'listings',           :action => 'edit1',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :put
  map.cat 'cat',      :controller => 'listings',           :action => 'edit2',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :put
  map.spec 'spec',    :controller => 'listings',           :action => 'edit3',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :put
  map.ship 'ship',    :controller => 'listings',           :action => 'edit4',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :put
  map.img 'img',      :controller => 'listings',           :action => 'edit5',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :put
  
  map.listing_remove 'listing_remove',      :controller => 'listings',           :action => 'remove',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :post

  map.update1 'update1', :controller => 'listings',        :action => 'update1',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :put
  map.update2 'update2', :controller => 'listings',        :action => 'update2',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :put
  map.update3 'update3', :controller => 'listings',        :action => 'update3',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :put
  map.update4 'update4', :controller => 'listings',        :action => 'update4',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :put
  map.update5 'update5', :controller => 'listings',        :action => 'update5',  :path_prefix => "/seller/:seller_id/listing/:id", :method => :put
  
  #Shop and Settings
  map.shop_update5 'shop_update5', :controller => 'shop',        :action => 'shop_update5', :method => :put
  
  #EVENT
  map.new_event2 'new_event2', :controller => 'events',   :action => 'new2', :path_prefix => "/events/:event_id", :method => :put
  map.new_event3 'new_event3', :controller => 'events',   :action => 'new3', :path_prefix => "/events/:event_id", :method => :put
  map.new_event4 'new_event4', :controller => 'events',   :action => 'new4', :path_prefix => "/events/:event_id", :method => :put
  map.new_event5 'new_event5', :controller => 'events',   :action => 'new5', :path_prefix => "/events/:event_id", :method => :put
  map.new_event6 'new_event6', :controller => 'events',   :action => 'new6', :path_prefix => "/events/:event_id", :method => :put
    
    #Autocompleter
    map.event_autocomplete_title 'event_autocomplete_title', :controller => 'events',   :action => 'autocomplete_title'
    
    #Index
    map.detailed_index 'detailed_index', :controller => 'events',   :action => 'index2'
    map.search_event 'event_search', :controller => 'searches',        :action => 'create',  :method => :get
    map.site '', :controller => 'site', :action => 'index'
  
  #The front-pages & search results - all as listings/index 2
  map.search 'search', :controller => 'searches', :action => 'show',  :method => :get
  map.autocomplete_search 'autocomplete_search', :controller => 'application', :action => 'autocomplete_search'
  map.overview 'overview' , :controller => 'listings',        :action => 'index2',  :method => :get
  
  #Requests & Bids routes
  map.bid_status_change 'status_change', :controller => 'bids',        :action => 'bid_status',  :method => :put
  map.close_request 'close_request',     :controller => 'requests',    :action => 'close',       :method => :put
  
  #Ordering routes
  map.new2 'new2',                :controller => 'orders',                      :action => 'new2',        :method => :get
  map.order_update2 'updated',    :controller => 'orders',                      :action => 'update2',     :method => :get
  map.sales1 'confirm_payment',   :controller => 'orders',                      :action => 'sales1_confirm_payment',     :method => :get 
  map.sales2 'confirm_shipping',  :controller => 'orders',                      :action => 'sales2_confirm_shipping',     :method => :get
  map.cancel 'cancel',            :controller => 'orders',                      :action => 'cancel',     :method => :get
  map.sales 'sales',            :controller => 'orders',                        :action => 'index2',     :method => :get
  map.completed_sales 'completed_sales',            :controller => 'orders',    :action => 'index3',     :method => :get
  map.completed_orders 'completed_orders',            :controller => 'orders',  :action => 'index4',     :method => :get
  map.remove_order 'remove_order',            :controller => 'orders',                      :action => 'remove',     :method => :get
  
  map.ratings2 'seller_feedback', :controller => 'ratings',         :action => 'rating2',    :method => :get
  map.rate_seller 'rate_seller',  :controller => 'ratings',         :action => 'rate_seller',:method => :get
  
  map.all_ratings 'all_ratings', :controller => 'ratings',         :action => 'index2',    :method => :get
  map.waiting_for_buyer_feedback 'awaiting_buyer_feedback',  :controller => 'ratings',         :action => 'index3',    :method => :get
  map.view_seller_ratings 'view_feedback',  :controller => 'ratings',         :action => 'index4',    :method => :get
  map.answer_feedback 'answer_feedback',  :controller => 'ratings',         :action => 'index5',    :method => :get
  
  #Ticketorder Routes
  map.new_ticketorder2 'new_ticketorder2', :controller => 'ticketorders',   :action => 'new2', :path_prefix => "/ticketorders/:ticketorders_id", :method => :put
  
  #Draw routes
  map.confirm_draw 'confirm_draw',     :controller => 'draws',    :action => 'confirm',       :method => :put
  map.failure_draw 'failure_draw',     :controller => 'draws',    :action => 'failure',       :method => :put
  
map.connect ':controller/:action/:id'
map.connect ':controller/:action/:id.:format'
end

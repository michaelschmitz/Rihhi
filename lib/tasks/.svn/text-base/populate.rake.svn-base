namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
##################
#### Settings ####     
##################
@messages = 0
@requests = 0
@bids = 0
@users = 2
@events_per_user = 1 #Minimum is 1! Depends on number of users!
@tickets_per_event = 1 #Minimum is 1! Depends on users * events * value here. Can be huge, be careful.
@listings = 100
@orders = 100
@deliverables_per_order = 3 
@movements_per_seller = 4
@draws = 2


puts "Populating database with the following settings"
puts "Messages: " + @messages.to_s
puts "Requests: " + @requests.to_s
puts "Bids: " + @bids.to_s
puts "Events per user: " + @events_per_user.to_s
puts "Tickets per event: " + @tickets_per_event.to_s
puts "Listings: " + @listings.to_s
puts "Orders: " + @orders.to_s
puts "Deliverables: " + @deliverables_per_order.to_s
puts "Movements per seller: " + @movements_per_seller.to_s
puts "Draws per seller: " + @draws.to_s

@complexity = @messages + @requests + @bids + (@users * 2) + (@events_per_user * @users) + (@tickets_per_event * @events_per_user * @users) + @orders + (@deliverables_per_order * @orders) + (@movements_per_seller * @users) + (@draws * @users)
puts ""
puts ""
puts "Total complexity: " + @complexity.to_s
puts ""
puts ""

  puts "Defining the random date function"
  def randomDate(params={})
    years_back = params[:year_range] || 5
    latest_year  = params [:year_latest] || 0
    year = (rand * (years_back)).ceil + (Time.now.year - latest_year - years_back)
    month = (rand * 12).ceil
    day = (rand * 31).ceil
    series = [date = Time.local(year, month, day)]
    if params[:series]
      params[:series].each do |some_time_after|
        series << series.last + (rand * some_time_after).ceil
      end
      return series
    end
    date
  end


  puts "Defined random dates"
  puts "Cleaning database"
  ###Remove every current entry.###
  [User, Seller, Listing, Shop, Category, Subcategory, Lastcategory, Order, Deliverable, Favorite, Hearted, Flagged, Request, Size, Color, Rating, Movement, Draw, Userpage].each(&:delete_all)
  puts "Database clean"

  puts "Messages are created"
  Message.populate @messages do |m|
    m.sender_id = 1 + rand(100)
    m.receiver_id = 1 + rand(100)
    m.sender_name = "SenderBoy"
    m.receiver_name = "ReceiverGirl"
    m.message = Faker::Lorem.sentences(sentence_count = rand(14))
    trigger = rand(2)
    subtrigger = rand(2)
    m.read = "No"
    m.sender_archived = "No"
    m.receiver_archived = "No"
    m.title = Faker::Lorem.sentences(sentence_count = rand(2))
    if trigger == 1
        m.read = "Yes"
        if subtrigger == 1
           m.sender_archived = "Yes"
           trigger = rand(2)
           if trigger == 1
           m.receiver_archived = "Yes"
           end     
        end
   end
 end
 
  puts "Requests are created"
  Request.populate @requests do |r|
    r.title = Faker::Lorem.words(word_count = 1 + rand(5))
    r.description = Faker::Lorem.sentences(3 + rand(5))
    
    r.ideal_price = (rand(50).to_s + '.' + (10 + rand(50)).to_s).to_f
    r.quantity = 1 + rand(2)
    r.tags = Faker::Lorem.words(word_count = rand(3))
    r.materials = Faker::Lorem.words(word_count = rand(3))
    r.user_id = 1 + rand(@users)
    r.full_name =  Faker::Name.name
    r.street = Faker::Address.street_address 
    r.city =  Faker::Address.city
    r.state =  Faker::Address.uk_county
    r.zip_code = Faker::Address.uk_postcode
    r.country =  Faker::Address.uk_country
    r.deadline = Date.today + rand(1500) 
    r.expiry_date = Date.today + 30
    r.posted_on = Date.today
    
    value = rand(3)
    r.request_status = case value
      when 0 then "open"
      when 1 then "open"
      else "closed"
    end 
  end

  puts "Bids are created"
  Bid.populate @bids do |b|
      b.request_id = 1 + rand(@users -1)
      b.seller_id = 1 + rand(@users -1)
      b.final_cost = (rand(50).to_s + '.' + (10 + rand(50)).to_s).to_f
      b.description = Faker::Lorem.sentences(3 + rand(5)) #
      b.preparation_time = "In " + rand(20).to_s + " weeks."
      
      value = rand(5)
      b.bid_status = case value
       when 0 then "open"
       when 1 then "accepted"
       when 2 then "refused"
       when 3 then "request closed"
       else "completed"
    end 
  end
 

puts "Inserting categories."
############################################################
### Begin of Category definitions  - English only for now###
############################################################
@subcategory_id = 1 # this should be counted upwards for the last-category entries.
#Fill in the main category
type = ["armor", "accessoires", "clothing", "figurines", "furniture", "make-up_and_masks", "tents_and_housing", "supplies", "weapons_(LARP)", "weapons_(Other)"]
type.each do |type|
  Category.populate 1 do |category|
    category.name = type
    category.locale = "en"
  end
end  
puts "Creating Armors"
  #Subcategories (currently 10 in total)
  #Armor - S1
  armor = ["arms", "full_armor", "helmet", "legs", "neck", "other", "shield", "torso"  ]
  armor.each do |arm|
      Subcategory.populate 1 do |sub|
        sub.name = arm
        sub.locale = "en"
        sub.category_id = 1
      end
  end
    ################################
    ### Lastcategories for Armors###
    ################################

    #Helmet
    armor = ["chain", "leather", "plate", "plastics", "other"]
    armor.each do |arm|
        Lastcategory.populate 1 do |last|
          last.name = arm
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Torso
    armor = ["chain", "leather", "plate", "plastics", "other"]
    armor.each do |arm|
        Lastcategory.populate 1 do |last|
          last.name = arm
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Arms
    armor = ["chain", "leather", "plate", "plastics", "other"]
    armor.each do |arm|
        Lastcategory.populate 1 do |last|
          last.name = arm
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Legs
    armor = ["chain", "leather", "plate", "plastics", "other"]
    armor.each do |arm|
        Lastcategory.populate 1 do |last|
          last.name = arm
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Neck
    armor = ["chain", "leather", "plate", "plastics", "other"]
    armor.each do |arm|
        Lastcategory.populate 1 do |last|
          last.name = arm
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Full Armor
    armor = ["chain", "leather", "plate", "plastics", "other"]
    armor.each do |arm|
        Lastcategory.populate 1 do |last|
          last.name = arm
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Other
    armor = ["all"]
    armor.each do |arm|
        Lastcategory.populate 1 do |last|
          last.name = arm
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
puts "Creating Accessoires"    
#Accessoires - S2
acc = ["belt", "bracelets", "charm", "eyewear", "hair", "keychain", "mirror", "mittens", "money_clips", "scarf"]
acc.each do |acc|
    Subcategory.populate 1 do |sub|
      sub.name = acc
      sub.locale = "en"
      sub.category_id = 2
    end
end
    #####################################
    ### Lastcategories for Accessoires###
    #####################################
    
    #Belts
    items = ["fantasy", "medieval", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Bracelets
    items = ["fantasy", "medieval", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Charm
    items = ["fantasy", "medieval", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
     #Eyewear
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
         #Hair
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
         #Keychain
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Mirror
    items = ["fantasy", "medieval", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
     #Mittens
    items = ["other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
     #Money Clips
    items = ["fantasy", "medieval", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
     #Scarfs
    items = ["fantasy", "medieval", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
puts "Creating Clothing"
#Clothing - S3
acc = ["blouses", "capes", "cloaks_and_jackets",  "corsage", "dresses", "gambesons", "gloves",  "pants",  "shirts", "skirts","tabards", "tunics"]
acc.each do |acc|
    Subcategory.populate 1 do |sub|
      sub.name = acc
      sub.locale = "en"
      sub.category_id = 3
    end
end
    #####################################
    ### Lastcategories for Clothing   ###
    #####################################
    
    #Blouses
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Capes
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Cloaks & Jackets
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Corsage
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Dresses
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Gambesons
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Gloves
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Pants
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
       #Shirts
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
       #Skirts
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
         #Tabbards
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
         #Tunics
    items = ["ladies", "men", "both", "kids", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
   puts "Creating Figurines" 
#Figurines - S4
acc = ["animals", "humans", "monsters", "objects"]
acc.each do |acc|
    Subcategory.populate 1 do |sub|
      sub.name = acc
      sub.locale = "en"
      sub.category_id = 4
    end
end
    #####################################
    ### Lastcategories for Figurines   ###
    #####################################
    
    #Animals
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Humans
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Monsters
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Objects
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
puts "Creating Furniture"    
#Furniture - S5
acc = ["armoire", "beds", "chairs", "chests", "couches", "tables", "wardrobes", "other"]
acc.each do |acc|
    Subcategory.populate 1 do |sub|
      sub.name = acc
      sub.locale = "en"
      sub.category_id = 5
    end
end
    #####################################
    ### Lastcategories for Furniture  ###
    #####################################
    
    #Armoire
    items = ["other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Beds
    items = ["other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Chairs
    items = ["other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Chests
    items = ["other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Couches
    items = ["other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Other
    items = ["other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Tables
    items = ["other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
       #Wardrobes
    items = ["other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    
puts "Creating Make-up"
#Make-up - S6
acc = [ "beards", "contact_lenses",  "masks", "paint", "teeth", "tools", "wigs" ]
acc.each do |acc|
    Subcategory.populate 1 do |sub|
      sub.name = acc
      sub.locale = "en"
      sub.category_id = 6
    end
end
    #####################################
    ### Lastcategories for Make-up    ###
    #####################################
    
    #Beards
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Contact lenses
    items = ["fantasy", "science_fiction", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Masks
    items = ["fantasy", "science_fiction", "other"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Paint
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
     #Teeth
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Tools
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
     #Wigs
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
puts "Creating Tents & Housing"
#Tents & Housing - S7
acc = ["medieval_tents", "expedition_tents", "huts"]
acc.each do |acc|
    Subcategory.populate 1 do |sub|
      sub.name = acc
      sub.locale = "en"
      sub.category_id = 7
    end
end
    #####################################
    ### Lastcategories for Tents & Housing    ###
    #####################################
    
    #Fantasy
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
       #Expedition
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
       #Huts
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
puts "Supplies"  
#Supplies - S8
acc = ["airbrush_tools",  "brushes", "cutters", "glass_fibre_bars", "latex_paint", "leather",  "metals", "patterns", "textiles" ]
acc.each do |acc|
    Subcategory.populate 1 do |sub|
      sub.name = acc
      sub.locale = "en"
      sub.category_id = 8
    end
end
    #####################################
    ###  Lastcategories for Supplies  ###
    #####################################
    #Airbrush tools
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Brushes
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Cutters
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Glass Fibre bars
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Latex paint
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Leather
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Metals
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Patterns
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end 
    @subcategory_id += 1
     #Textiles
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1

puts "Creating Weapons (LARP)"
#Weapons [LARP] - S9
acc = ["ammunition", "axes", "bows", "clubs", "crossbows", "daggers", "DIY_Kits", "exotics", "flails", "hammers", "long-range", "other", "polearms", "shields", "swords"]
acc.each do |acc|
    Subcategory.populate 1 do |sub|
      sub.name = acc
      sub.locale = "en"
      sub.category_id = 9
    end
end
    #####################################
    ###  Lastcategories for Weapons  ###
    #####################################
    
    #Ammunition
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Axes
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Bows
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Clubs
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Crossbows
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Daggers
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #DIY-Kits
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Exotics
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Flails
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Hammers
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Long range
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Others
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Polearms
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Shields
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Swords
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    
puts "Creating Weapons (Real)"
#Weapons [Real] - S10
acc = ["ammunition", "axes", "bows", "clubs", "crossbows", "daggers", "DIY_Kits", "exotics", "flails", "hammers", "long-range", "other", "polearms", "shields", "swords"]
acc.each do |acc|
    Subcategory.populate 1 do |sub|
      sub.name = acc
      sub.locale = "en"
      sub.category_id = 10
    end
end
    ##########################################
    ###  Lastcategories for Weapons (REAL) ###
    ##########################################
    
    #Ammunition
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Axes
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Bows
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Clubs
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Crossbows
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Daggers
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #DIY-Kits
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Exotics
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Flails
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
    #Hammer
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Long range
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Others
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Polearms
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Shields
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
      #Swords
    items = ["all"]
    items.each do |i|
        Lastcategory.populate 1 do |last|
          last.name = i
          last.locale = "en"
          last.subcategory_id = @subcategory_id
        end
    end
    @subcategory_id += 1
################################
#### End of subcategories   ####
################################


###################################
### End of Category definitions ###
###################################


#Populating the user, the seller and the shop.
    i = 0
    eventcount = 0
    ticketscount = 0
User.populate 1 + @users do |user|
  puts "Populating user #" + i.to_s
  i += 1
  login = Faker::Name.last_name
  login += rand(2999).to_s
  user.login = login
  user.friends_visible = "Yes"
  user.email = Faker::Internet.email
  user.created_at = randomDate(:year_range => 4, :year_latest => 0)
  user.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--")
  user.crypted_password = User.encrypt("rihhi",user.salt)
  user.activated_at = Time.now
  user.activation_code = "Yippi"
  user.friends_visible = "Yes"
  Userpage.populate 1 do |up|
    up.user_id = user.id
    up.about_me = Faker::Lorem.words(2 + rand(3)).join(" ").to_s.capitalize
    up.about_me_p = "No"
    up.status_p = "No"
    up.real_name_p = "No"
    up.homepage_p = "No"
    up.region_p = "No"
    up.larp_setting_p = "No"
    up.larp_philosophy_p = "No"
    up.favorite_characters_p = "No"
    up.player_group_p = "No"
    up.homepage_of_group_p = "No"
    up.relationship_p = "No"
    up.looking_for_p = "No"
    up.contact_me_p = "No"
    up.future_const_p = "No"
    up.last_cons_p = "No"
    up.ask_me_about_p = "No"
    up.music_p = "No"
    up.books_p = "No"
    up.movies_p = "No"
    up.other_hobbies_p = "No"
    up.what_if_p = "No"
    nbr = 1 + rand(3)
      up.preferred_language = case nbr
        when 1 then "en"
        when 2 then "cz"
        when 3 then "de"                
        when 4 then "pl"
      end
    
  end
  
  puts " ... adding event: " + eventcount.to_s
  Event.populate 1 + rand(@events_per_user) do |e|
      eventcount += 1
      e.user_id = i
      e.title = Faker::Lorem.words(2 + rand(3)).join(" ").to_s.capitalize
      e.subtitle = Faker::Lorem.words(2 + rand(3)).join(" ").to_s.capitalize
      date = randomDate(:year_range => 4, :year_latest => 0)
      e.startdate = date
      e.enddate = date + (1 + rand(12)).days
      e.ticket_deadline = randomDate(:year_range => 4, :year_latest => 0)
      e.description = Faker::Lorem.sentences(sentence_count = rand(8))
      e.creator_name = ""      
      e.orga_name  = Faker::Lorem.words(2).join(" ").to_s.capitalize + " LARP E.V."
      e.orga_website = Faker::Internet.domain_name()
      e.orga_email= Faker::Internet.email      
      e.name_of_contact1 = Faker::Name.name
      e.street_of_contact1 = Faker::Address.street_address 
      e.area_code_of_contact1 =  Faker::Address.uk_postcode
      e.city_of_contact1 = Faker::Address.city
      e.country_of_contact1 = Faker::Address.uk_country
      e.tel1_of_contact1 = Faker::PhoneNumber.phone_number()
      e.tel2_of_contact1 = Faker::PhoneNumber.phone_number()
      e.description_of_contact1_availability = Faker::Lorem.sentences(sentence_count = rand(2))
      e.fax_of_contact1    = Faker::PhoneNumber.phone_number()   
      e.email_of_contact1 = Faker::Internet.email
      e.name_of_contact2 = Faker::Name.name
      e.street_of_contact2 = Faker::Address.street_address 
      e.area_code_of_contact2 =  Faker::Address.uk_postcode
      e.city_of_contact2  = Faker::Address.city
      e.country_of_contact2 = Faker::Address.uk_country
      e.tel1_of_contact2 = Faker::PhoneNumber.phone_number()
      e.tel2_of_contact2 = Faker::PhoneNumber.phone_number()
      e.description_of_contact2_availability = Faker::Lorem.sentences(sentence_count = rand(2))
      e.fax_of_contact2 = Faker::PhoneNumber.phone_number()
      e.email_of_contact2 = Faker::Internet.email
      e.invitation_only = rand(1)
      e.invitation_code = Faker::Lorem.words(word_count = 1)
      e.location = "Dragonscale Castle"
      e.street = Faker::Address.street_address 
      e.area_code =  Faker::Address.uk_postcode
      e.city = Faker::Address.city
      e.region = Faker::Address.uk_county
      #Michaels country names list:
      list = [
      "country.European_Union",
      "country.Everywhere",
      "country.Afghanistan",
      "country.Aland_Islands",
      "country.Albania",
      "country.Algeria",
      "country.American_Samoa",
      "country.Andorra",
      "country.Angola",
      "country.Anguilla",   
      "country.Antigua_and_Barbuda",
      "country.Argentina",
      "country.Armenia",
      "country.Aruba",
      "country.Australia",
      "country.Austria",
      "country.Azerbaijan",
      "country.Bahamas",
      "country.Bahrain",
      "country.Bangladesh",
      "country.Barbados",
      "country.Belarus",
      "country.Belgium",
      "country.Belize",
      "country.Benin",
      "country.Bermuda",
      "country.Bhutan",
      "country.Bolivia",
      "country.Bosnia_and_Herzegowina",
      "country.Botswana",
      "country.Bouvet_Island",
      "country.Brazil",
      "country.British_Indian_Ocean_Territory",
      "country.Brunei_Darussalam",
      "country.Bulgaria",
      "country.Burkina_Faso",
      "country.Burundi_Cambodia",
      "country.Cameroon",
      "country.Canada",
      "country.Cape_Verde",
      "country.Cayman_Islands",
      "country.Central_African_Republic",
      "country.Chad",
      "country.Chile",
      "country.China",
      "country.Christmas_Island",
      "country.Cocos_(Keeling)_Islands",
      "country.Colombia",
      "country.Comoros",
      "country.Congo",         
      "country.Congo_the_Democratic_Republic_of_the",
      "country.Cook_Islands",
      "country.Costa_Rica",
      "country.Cote_d_Ivoire",
      "country.Croatia",
      "country.Cuba",
      "country.Cyprus",
      "country.Czech_Republic",
      "country.Denmark",
      "country.Djibouti",
      "country.Dominica",
      "country.Dominican_Republic",
      "country.Ecuador",
      "country.Egypt",            
      "country.El_Salvador",
      "country.Equatorial_Guinea",
      "country.Eritrea",
      "country.Estonia",
      "country.Ethiopia",
      "country.Falkland_Islands (Malvinas)",          
      "country.Faroe_Islands",
      "country.Fiji",
      "country.Finland",
      "country.France",
      "country.French_Guiana",
      "country.French_Polynesia",
      "country.French_Southern_Territories",
      "country.Gabon",
      "country.Gambia",
      "country.Georgia",
      "country.Germany",
      "country.Ghana",
      "country.Gibraltar",
      "country.Greece",
      "country.Greenland",
      "country.Grenada",
      "country.Guadeloupe",
      "country.Guam",
      "country.Guatemala",
      "country.Guernsey",
      "country.Guinea",
      "country.Guinea-Bissau",
      "country.Guyana",
      "country.Haiti",
      "country.Heard_and_McDonald_Islands",
      "country.Holy_See",
      "country.Honduras",
      "country.Hong_Kong", 
      "country.Hungary",
      "country.Iceland",
      "country.India",
      "country.Indonesia",
      "country.Iran_Islamic_Republic_of",
      "country.Iraq",
      "country.Ireland",
      "country.Isle_of_Man", 
      "country.Israel",
      "country.Italy",
      "country.Jamaica",
      "country.Japan", 
      "country.Jersey",
      "country.Jordan",
      "country.Kazakhstan",
      "country.Kenya",
      "country.Kiribati",
      "country.Korea_Democratic_Peoples_Republic_of",
      "country.Korea_Republic_of",         
      "country.Kuwait",
      "country.Kyrgyzstan",
      "country.Lao_Peoples_Democratic_Republic",
      "country.Latvia",
      "country.Lebanon",
      "country.Lesotho",
      "country.Liberia",
      "country.Libyan_Arab_Jamahiriya",
      "country.Liechtenstein",
      "country.Lithuania",
      "country.Luxembourg",
      "country.Macao",
      "country.Macedonia_The_Former_Yugoslav_Republic_Of",
      "country.Madagascar", 
      "country.Malawi",
      "country.Malaysia",
      "country.Maldives", 
      "country.Mali",
      "country.Malta", 
      "country.Marshall_Islands",
      "country.Martinique",
      "country.Mauritania",
      "country.Mauritius",
      "country.Mayotte",
      "country.Mexico", 
      "country.Micronesia_Federated_States_of",
      "country.Moldova_Republic_of",
      "country.Monaco",
      "country.Mongolia",
      "country.Montenegro",
      "country.Montserrat",
      "country.Morocco", 
      "country.Mozambique",
      "country.Myanmar",
      "country.Namibia",
      "country.Nauru",
      "country.Nepal",
      "country.Netherlands",
      "country.Netherlands_Antilles",
      "country.New_Caledonia",
      "country.New_Zealand",
      "country.Nicaragua",
      "country.Niger",
      "country.Nigeria",
      "country.Niue",
      "country.Norfolk_Island",
      "country.Northern_Mariana_Islands", 
      "country.Norway",
      "country.Oman",
      "country.Pakistan",
      "country.Palau",
      "country.Palestinian_Territory_Occupied",
      "country.Panama",
      "country.Papua_New_Guinea",
      "country.Paraguay",
      "country.Peru",
      "country.Philippines",
      "country.Pitcairn",
      "country.Poland",
      "country.Portugal", 
      "country.Puerto_Rico",
      "country.Qatar",
      "country.Reunion",
      "country.Romania", 
      "country.Russian_Federation",
      "country.Rwanda",
      "country.Saint_Barthelemy",
      "country.Saint_Helena",
      "country.Saint_Kitts_and_Nevis",
      "country.Saint_Lucia",
      "country.Saint_Pierre_and_Miquelon",
      "country.Saint_Vincent_and_the_Grenadines",
      "country.Samoa", 
      "country.San_Marino",
      "country.Sao_Tome_and_Principe",
      "country.Saudi_Arabia",
      "country.Senegal",
      "country.Serbia",
      "country.Seychelles",
      "country.Sierra_Leone",
      "country.Singapore",
      "country.Slovakia", 
      "country.Slovenia",
      "country.Solomon_Islands",
      "country.Somalia",
      "country.South_Africa",
      "country.South_Georgia_and_the_South_Sandwich_Islands",
      "country.Spain",
      "country.Sri_Lanka",
      "country.Sudan",
      "country.Suriname",
      "country.Svalbard_and_Jan_Mayen",
      "country.Swaziland",
      "country.Sweden",
      "country.Switzerland", 
      "country.Syrian_Arab_Republic",
      "country.Taiwan Tajikistan",
      "country.Tanzania_United_Republic_of",
      "country.Thailand",
      "country.Timor-Leste",      
      "country.Togo",
      "country.Tokelau",
      "country.Tonga",
      "country.Trinidad_and_Tobago",
      "country.Tunisia",
      "country.Turkey",
      "country.Turkmenistan",
      "country.Turks_and_Caicos_Islands", 
      "country.Tuvalu",
      "country.Uganda",
      "country.Ukraine",
      "country.United_Arab_Emirates",
      "country.United_ Kingdom",
      "country.United_States",
      "country.United_States_Minor_Outlying_Islands",
      "country.Uruguay",
      "country.Uzbekistan",
      "country.Vanuatu",
      "country.Venezuela",
      "country.Viet_Nam",
      "country.Virgin_Islands_British",
      "country.Virgin_IslandsUS",
      "country.Wallis_and_Futuna",
      "country.Western_Sahara",
      "country.Yemen",
      "country.Zambia",
      "country.Zimbabwe"]
      #      
      e.country = list[rand(200)]
      e.location_description = Faker::Lorem.sentences(sentence_count = rand(6))
      e.genre = "Fantasy"
      e.genre_description = ""      
      e.rules = "DragonSys"
      e.rules_description = "Extended Edition"
      e.catering = "Full service"
      e.catering_description = "Breakfast, Lunch, Dinner"
      acc = [
      "accomodation.camping",
      "accomodation.camping_ours",
      "accomodation.building",
      "accomodation.other",
      "accomodation.none",
      "accomodation.castle",
       
        "accomodation.youth_hostel"]
      e.accomodation = acc[rand(5)]
      e.accomodation_description = Faker::Lorem.sentences(sentence_count = rand(4))
      e.campaign = "No campaign"
      e.campaign_description  = ""
      e.minimum_age = 1 + rand(5) 
      e.ambiente = 1 + rand(5)
      e.fights = 1 + rand(5)
      e.battles = 1 + rand(5)
      e.magic = 1 + rand(5)
      e.mysteries = 1 + rand(5)      
      e.event_status = "SC and NSC places available"
      e.available_sc = 1 + rand(225)
      e.available_nsc = 1 + rand(225)
      e.max_sc = e.available_nsc + rand(2265)
      e.max_nsc = e.available_sc + rand(2265)
      e.tickets_available_on_rihhi = rand(1)
      e.currency = "EUR"
      e.account_holder_name = Faker::Name.name 
      e.account_number = rand(3293888)
      e.bank_identifier = rand(3293888)
      e.paypal_account = e.email_of_contact1      
      e.url_to_invitation = "www.schreiborga.com/Elfencastle2"
      e.link_to_forum_discussion = "www.rihhi.com/forum/event" + e.id.to_s
      c = 0
      puts " ... adding ticket " + ticketscount.to_s
      Ticket.populate 1 + rand(@tickets_per_event) do |t|
        ticketscount += 1
        c += 1
        t.event_id = eventcount            
        k = rand(0)
        if k == 1
          t.sc_or_nsc = "NSC - Non-player character"           
        else
          t.sc_or_nsc = "PC - Player character"     
        end        
        t.name = Faker::Lorem.words(2).join(" ").to_s.capitalize
        t.seller_id = user.id
        t.valid_from = e.startdate
        t.valid_until = e.enddate
        t.description = Faker::Lorem.sentences(sentence_count = rand(16)) 
        x = rand(5)
        y = rand(5)
        t.price1 = 1.00 + rand(200.00) + ("0." + 1.to_s).to_f + ("0.0" + y.to_s).to_f
        t.price2 = 1.00 + rand(200.00) + ("0." + x.to_s).to_f + ("0.0" + y.to_s).to_f
        t.price3 = 1.00 + rand(200.00) + ("0." + x.to_s).to_f + ("0.0" + y.to_s).to_f
        t.price4 = 1.00 + rand(200.00) + ("0." + x.to_s).to_f + ("0.0" + y.to_s).to_f
        t.price5 = 1.00 + rand(200.00) + ("0." + x.to_s).to_f + ("0.0" + y.to_s).to_f
        t.price1_deadline = date - (44 + rand(112)).days
        t.price2_deadline = t.price1_deadline + (1 + rand(10)).days
        t.price3_deadline = t.price2_deadline + (1 + rand(10)).days
        t.price4_deadline = t.price3_deadline + (1 + rand(10)).days
        t.price5_deadline = t.price4_deadline + (1 + rand(10)).days
        t.nr_of_tickets_sold = rand(100) 
        t.nr_of_tickets_available_online = t.nr_of_tickets_sold.to_i + rand(100) 
        t.has_deal = rand(1)
        t.deal_pickup_at_event = rand(1)
        t.is_shipped = rand(1)
        t.shipping_cost_domestic  = 1.00 + rand(200.00) + ("0." + x.to_s).to_f + ("0.0" + y.to_s).to_f
        t.shipping_cost_abroad = 1.00 + rand(200.00) + ("0." + x.to_s).to_f + ("0.0" + y.to_s).to_f
        if e.tickets_available_on_rihhi == 1
          t.ticket_available_on_rihhi = 1
        else
          t.ticket_available_on_rihhi = 0
        end
        t.position = c.to_i
        if t.has_deal == 1
         Tlisting.populate 1 + rand(4) do |tl|
            tl.ticket_id = 1 + rand(1400)
            tl.listing_id = 1 + rand(500)          
        end
      end
      #End of Ticket
    end
    #End of Event
  end
  
  Seller.populate 1 do |seller|
    puts "... adding seller "
    seller.user_id = user.id
    #Address data
    seller.full_name = Faker::Name.name
    seller.street = Faker::Address.street_address 
    seller.post_code =  Faker::Address.uk_postcode
    seller.city = Faker::Address.city
    seller.area = Faker::Address.uk_county
    seller.country = Faker::Address.uk_country
    #How we charge the seller 
  
    takko = 1 + rand(2)
    if takko == 1
    seller.electronic_direct_debit = "No"
    else
    seller.electronic_direct_debit = "Yes"            
    seller.account_holder_name = Faker::Name.name     
    seller.account_number = rand(3293888)
    seller.bank_identifier = rand(3928181)
    end
    #Ratings
    pos = 0.0
    neg = 0.0
    pos = 1 + rand(80)
    neg = 1 + rand(8)
    seller.neg = neg
    seller.pos = pos
    seller.number_of_ratings = seller.neg + seller.pos
    seller.rating = (pos/(pos+neg))*100
    #Admin-info
    seller.seller_status = "Good"
    seller.account_balance = 0.0
    seller.turnover = 0.0
    
    Shop.populate 1 do |shop|
      #Shopinfo
      shop.seller_id = seller.id
      shop.shop_image_url = Faker::Internet.domain_name()
      shop.about_my_shop = Faker::Lorem.sentences(sentence_count = rand(4))
      shop.shop_tos = Faker::Lorem.sentences(sentence_count = rand(20))
      #Company pre-sets
      shop.company_name = Faker::Company.name
      shop.tax_number = Faker::PhoneNumber.phone_number()
      shop.percentage_vat = Faker::PhoneNumber.phone_number()
      #Shipping presets
      shop.country1 = "country.Germany",
      shop.country2 = "country.European_Union"    
      shop.country3 = "-------"   
      shop.country4 = "-------"
      shop.country5 = "-------"   
      shop.country1_shipping = (1 + rand(5)).to_s + ".00"
      shop.country2_shipping = (1 + rand(7)).to_s + ".00"
      shop.country3_shipping = (1 + rand(9)).to_s + ".00"
      shop.country4_shipping = (1 + rand(12)).to_s + ".00"
      shop.country5_shipping = (1 + rand(14)).to_s + ".00"
      shop.country1_shipping_with_another_item = (1 + rand(2)).to_s + ".00"
      shop.country2_shipping_with_another_item = (1 + rand(3)).to_s + ".00"
      shop.country3_shipping_with_another_item = (1 + rand(4)).to_s + ".00"
      shop.country4_shipping_with_another_item = (1 + rand(5)).to_s + ".00"
      shop.country5_shipping_with_another_item = (1 + rand(6)).to_s + ".00"
      shop.country1_deliverytime = (1 + rand(2)).to_s 
      shop.country2_deliverytime = (2 + rand(2)).to_s 
      shop.country3_deliverytime = (3 + rand(2)).to_s 
      shop.country4_deliverytime = (4 + rand(2)).to_s
      shop.country5_deliverytime = (5 + rand(2)).to_s 
      shop.shipping_comments = Faker::Lorem.sentences(sentence_count = rand(4))
      #Buyer can pay seller via - Presets
      shop.allow_paypal = "Yes"
      shop.paypal_account = Faker::Internet.email
      shop.allow_bank_transfer = "Yes"
      shop.bank_account_holder = Faker::Name.name
      shop.bank_bic = Faker::PhoneNumber.phone_number()
      shop.bank_iban = Faker::PhoneNumber.phone_number()
      shop.allow_cheque = "Yes"
      shop.allow_cash_on_delivery = "Yes"  
    
      
    end#End of shop
    
    puts "Creating movements for this seller" 
    account_balance = 0.0
    turnover = 0.0
    Movement.populate @movements_per_seller do |m|
      m.seller_id = seller.id
      nbr = 1 + rand(4)
      m.code = case nbr
        when 1 then 1
        when 2 then 2
        when 3 then 3                
        when 4 then 4
      end
      #If 1 - Turnover increase
      #If 2 - 0,20 Euro Charge
      #If 3 - 3% of random Charge
      #If 4 - Balance change after debiting of bank account
      
      if nbr == 1
        m.code = 1
        value = 403.30
        order = (1 + rand(@orders))
        m.reason = "Your sale <a href=\"orders/" + (1 + rand(@orders)).to_s + "\">" + (1+(rand(299))).to_s + "</a> was set to completed. Your overall turnover has increased by " + value.to_s + " Euro."
        m.value = value.to_f
        m.email = 0
        m.dispute = 0
        m.order_id = order
        turnover += m.value
      elsif nbr == 2
        value = 0.20
        m.code = 2
        m.reason = "You listed a new item (<a href=\"listings/" + (1 + rand(@listings)).to_s + "\">Sword of Steel</a>). Your account has been charged with 0,20 EUR."
        m.value = 0.20
        m.email = 0
        m.dispute = 0
        account_balance += value
      elsif nbr == 3
        m.code = 3
        value = 13.09
        order = (1 + rand(@orders))
        m.reason = "Your sale <a href=\"orders/" + (1 + rand(@orders)).to_s + "\">" + (1+(rand(299))).to_s + "</a> was set to completed. Your account has been charged with " + value.to_s + " Euro."
        m.value = value.to_f
        m.email = 0
        m.dispute = 0
        m.order_id = order
        account_balance += value
      elsif nbr == 4
        m.code = 4
        value = 5.50
        m.reason = "Your bank account has been debited for " + value.to_s + " EUR. Your outstanding account balance has decreased by this amount."
        m.value = value.to_f
        m.email = 0
        m.dispute = 0
        if account_balance >= value
          account_balance -= value
        else
          account_balance = 0
        end
      end
    end #end of movements for this seller
    seller.account_balance = account_balance
    seller.turnover = turnover
    puts "Seller account balance is" + account_balance.to_s
    
    Draw.populate @draws do |d|
      d.list = 1
      d.seller_id = seller.id
      d.balance_now = seller.account_balance
      d.login_name = Faker::Lorem.words(2).join(" ").to_s.capitalize
      d.name = seller.full_name
      d.account_holder = seller.account_holder_name
      d.iban = seller.account_number
      d.bic = seller.bank_identifier
      d.debited = 0.00
      d.difference = 0
      d.fail = 0    
    end
    
  end#Seller
   user.is_seller = true
end#User

#Populating the listing, required.
  l = 0
  Listing.populate @listings do |listing|
    puts "Populating listing #" + l.to_s
    l += 1
    listing.v = 0
    listing.seller_id = 1 + rand(@users)
    listing.title = Faker::Lorem.words(2).join(" ").to_s.capitalize    
    listing.description = Faker::Lorem.sentences(5).join(" ")
    x = rand(10)
    y = rand(10)
    listing.price = 1.00 + rand(200.00) + ("0." + x.to_s).to_f + ("0.0" + y.to_s).to_f
    listing.sellerspecific_id = 1 + rand(238288282)
    listing.category_id = 1 + rand(7)                                         #Currently armors
    listing.subcategory_id = 1 + rand(5)                                      #Now subcategories from armors only.
    listing.lastcategory_id = 1 + rand(1)                                     #Now lastcategories from the first two subs only
    listing.category_tag = Faker::Lorem.words(rand(6)).join(", ").to_s.capitalize
    listing.material_tag = Faker::Lorem.words(rand(6)).join(", ").to_s.capitalize
    listing.public_tag = Faker::Lorem.words(rand(6)).join(", ").to_s.capitalize
    listing.item_height = rand(200)
    listing.item_width = rand(200)
    listing.item_length = rand(200)
    listing.item_weight = rand(4000)
    listing.country1 = "country.Germany"
    listing.country2 = "country.European_Union"
    listing.country3 = "country.United_States"
    listing.country4 = "country.Australia"
    listing.country5 = "country.Everywhere"
    listing.preparation_time = 1 + rand(102)
    listing.country1_shipping = 5
    listing.country2_shipping = 10
    listing.country3_shipping = 15
    listing.country4_shipping = 20
    listing.country5_shipping = 25
    listing.country1_shipping_with_another_item = 2
    listing.country2_shipping_with_another_item = 4
    listing.country3_shipping_with_another_item = 6
    listing.country4_shipping_with_another_item = 8
    listing.country5_shipping_with_another_item = 10
    listing.country1_deliverytime = (1 + rand(2)).to_s + " - " + (3 + rand(4)).to_s
    listing.country2_deliverytime = (2 + rand(2)).to_s + " - " + (3 + rand(4)).to_s
    listing.country3_deliverytime = (3 + rand(2)).to_s + " - " + (3 + rand(4)).to_s
    listing.country4_deliverytime = (4 + rand(2)).to_s + " - " + (3 + rand(4)).to_s
    listing.country5_deliverytime = (5 + rand(2)).to_s + " - " + (3 + rand(4)).to_s
    listing.shipping_comments = "Die Frachtkosten zahlt der Käufer. Zahlbar per Nachnahme, PayPal oder Vorkasse. Beim Nachnahmeversand kommen 25,-EUR Nachnahmegebühr hinzu. Der Versand ins Ausland erfolgt nur gegen Vorkasse oder Bezahlung über PayPal."
    listing.safe_for_larp = rand(2)
    listing.safe_for_reenactment = rand(2)
    listing.suggested_complements = "dud"
    listing.favorited_number = rand(150)
    listing.hearted_number = rand(150)
    listing.nr_of_items_in_stock = rand(10)
    listing.quality = case 1 + rand(2)
      when 0 then "New"
      when 1 then "Used"      
    end    
    listing.renting = case 1 + rand(3)
      when 0 then "No"
      when 1 then "Yes"
      when 2 then "Out" 
    end        
    listing.removed = 0
    listing.creation = "completed"
    listing.pic1_file_name = l.to_s + ".jpg"
    
    #Add matching sizes and colors
    Size.populate 1 do |s|
      s.listing_id = listing.id
      s.xxs = rand(2)
      s.xs = rand(2)
      s.s = rand(2)
      s.m = rand(2)
      s.l = rand(2)
      s.xl = rand(2)
      s.xxl = rand(2)
      s.xxxl = rand(2)
      s.all = rand(2)            
    end
    Color.populate 1 do |c|
      c.listing_id = listing.id            
      c.black = rand(2)
      c.gold = rand(2)
      c.silver = rand(2)
      c.purple = rand(2)
      c.lime = rand(2)
      c.blue = rand(2)
      c.brown = rand(2)
      c.yellow = rand(2)
      c.maroon = rand(2)
      c.fuchsia = rand(2)
      c.olive = rand(2)
      c.teal = rand(2)
      c.white = rand(2)
      c.gray = rand(2)
      c.red = rand(2)
      c.green = rand(2)
      c.navy = rand(2)
      c.other = rand(2)   
    end
end # Closes the listing.
      
  deliverablecount = 0
  puts "Creating orders"       
  Order.populate @orders do |o|
    o.seller_id = 1 + rand(@users)
    o.user_id = 1 + rand(@users)
    o.step  = "step4"        #At which step in the ordering process? Step 2 is new.html, Step3 is new2.html (click to buy)
    wert = rand(4)
    o.payment_chosen = case wert
      when 0 then "bank"
      when 1 then "paypal"
      when 2 then "cheque"
      when 3 then "cod"      
    end
    value = rand(6)
      o.status = case value 
        when 0 then "ordered"
        when 1 then "payment_arrived"
        when 2 then "shipped"
        when 3 then "buyerfeedback_received"
        when 4 then "cancelled"
      else "closed"
    end
    
    if value = 4
      o.cancel_reason = Faker::Lorem.sentences(sentence_count = rand(6))
    end

    if value >= 1
      o.date_payment_arrived = (20 + rand(3)).days.ago
    end
    if value >= 2
      o.date_shipped = (15 + rand(3)).days.ago
    end
    if value >= 3
      o.date_buyerfeedback_received = (10 + rand(3)).days.ago
    end
    if value >= 4
      o.date_sellerfeedback_received = (2 + rand(3)).days.ago
      o.date_closed = o.date_sellerfeedback_received
    end
     
    o.number_of_deliverables = 1+ rand(5)
    o.price_of_all_deliverables = "22.22"
    o.cost_of_shipping = "33.33"
    o.total_cost_of_order = "444.44"    
    o.user_fullname = Faker::Name.name
    o.user_address = Faker::Address.street_address 
    o.user_areacode =  Faker::Address.uk_postcode
    o.user_city = Faker::Address.city
    o.user_country = Faker::Address.uk_country
    o.highest_preparation_time = 1 + rand(41)
    #Create some deliverables for this order.
    puts "Creating Deliverable"       + deliverablecount.to_s
    Deliverable.populate (1 + rand(@deliverables_per_order)) do |d|
      deliverablecount += 1 
      d.order_id = o.id
      d.listing_id = 1 + rand(100)
      d.amount = rand(12)
      nbr = rand(7)
      d.size = case nbr
        when 0 then "size.all"
        when 1 then "size.xxs"
        when 2 then "size.xs"
        when 3 then "size.s"
        when 4 then "size.m"
        when 5 then "size.l"
        when 6 then "size.xl"        
        else "size.xxl"
      end
      nbr = rand(4)
      d.color = case nbr
        when 0 then "color.black"
        when 1 then "color.lime"
        when 2 then "color.gold"        
        else "color.silver"
      end
      
      #Copying information from the listing.
      y = Listing.find(d.listing_id)
      
      d.title = y.title
      d.description = y.description
      d.price = y.price            
      d.category_id = y.category_id
      d.subcategory_id = y.subcategory_id
      d.lastcategory_id = y.lastcategory_id
      d.material_tag = y.material_tag
      d.public_tag = y.public_tag
      d.item_height = y.item_height
      d.item_width = y.item_width
      d.item_length = y.item_length
      d.item_weight = y.item_weight
      d.safe_for_larp = y.safe_for_larp
      d.safe_for_reenactment = y.safe_for_reenactment
      d.preparation_time = y.preparation_time
      d.country1 = y.country1
      d.country2 = y.country2
      d.country3 = y.country3
      d.country4 = y.country4
      d.country5 = y.country5
      d.country1_shipping = y.country1_shipping
      d.country2_shipping = y.country2_shipping
      d.country3_shipping = y.country3_shipping
      d.country4_shipping = y.country4_shipping
      d.country5_shipping = y.country5_shipping
      d.country1_shipping_with_another_item = y.country1_shipping_with_another_item
      d.country2_shipping_with_another_item = y.country2_shipping_with_another_item
      d.country3_shipping_with_another_item = y.country3_shipping_with_another_item
      d.country4_shipping_with_another_item = y.country4_shipping_with_another_item
      d.country5_shipping_with_another_item = y.country5_shipping_with_another_item
      d.country1_deliverytime = y.country1_deliverytime
      d.country2_deliverytime = y.country2_deliverytime
      d.country3_deliverytime = y.country3_deliverytime
      d.country4_deliverytime = y.country4_deliverytime
      d.country5_deliverytime = y.country5_deliverytime 
      d.pic1_file_name = y.pic1_file_name
      d.pic1_content_type = y.pic1_content_type
      d.pic1_file_size = y.pic1_file_size
      d.pic1_updated_at = y.pic1_updated_at
    end
    #Creating a rating for this order to play around with (if the order is set to shipped or buyerfeedback received
    Rating.populate 1 do |r|
       r.order_id = o.id
       r.user_id = o.user_id
       r.seller_id = o.seller_id      
       r.sellertext = ""
       r.usertext = ""
       r.dispute = false
       r.user_has_rated = false
       r.seller_has_rated = false
       r.sellerrating = 9 #9 is the standard value to show that this has not been rated yed.
       r.userrating = 9
      if o.status == "buyerfeedback_received"
       r.userrating = 1 + rand(2)  
       r.user_has_rated = true
       r.sellertext = ""
       r.usertext = Faker::Lorem.sentences(sentence_count = 1)     
     elsif o.status == "sellerfeedback_received"
       r.sellerrating = 1 + rand(2)
       r.userrating = 1 + rand(2)
       r.user_has_rated = true
       r.seller_has_rated = true
       r.sellertext = Faker::Lorem.sentences(sentence_count = 1)
       r.usertext = Faker::Lorem.sentences(sentence_count = 1)      
      #New rating matching this, but no entries
      end#end of rating per seller
    end  
  end
  
 
  #Created ratings. Complete
  puts "Creation almost complete. Now waiting for database feedback (Click website to see console updates)."
 #This end closes this document. 
end
end
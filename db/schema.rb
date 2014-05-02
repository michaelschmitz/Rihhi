# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100816203623) do

  create_table "bids", :force => true do |t|
    t.integer  "seller_id"
    t.decimal  "final_cost",              :precision => 8, :scale => 2
    t.string   "preparation_time"
    t.string   "bid_status"
    t.text     "description"
    t.integer  "request_id"
    t.string   "step"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "listing_id"
    t.integer  "cart_id"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.integer  "amount"
    t.string   "size"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colors", :force => true do |t|
    t.integer  "listing_id"
    t.string   "black"
    t.string   "gold"
    t.string   "silver"
    t.string   "purple"
    t.string   "lime"
    t.string   "blue"
    t.string   "brown"
    t.string   "yellow"
    t.string   "maroon"
    t.string   "fuchsia"
    t.string   "olive"
    t.string   "teal"
    t.string   "white"
    t.string   "gray"
    t.string   "red"
    t.string   "green"
    t.string   "navy"
    t.string   "other"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliverables", :force => true do |t|
    t.integer  "listing_id"
    t.integer  "order_id"
    t.integer  "amount"
    t.string   "title"
    t.text     "description"
    t.decimal  "price",                               :precision => 8, :scale => 2
    t.string   "color"
    t.string   "size"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "lastcategory_id"
    t.string   "material_tag"
    t.string   "public_tag"
    t.string   "item_height"
    t.string   "item_width"
    t.string   "item_length"
    t.string   "item_weight"
    t.string   "safe_for_larp"
    t.string   "safe_for_reenactment"
    t.string   "preparation_time"
    t.string   "country1"
    t.string   "country2"
    t.string   "country3"
    t.string   "country4"
    t.string   "country5"
    t.decimal  "country1_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country2_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country3_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country4_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country5_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country1_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country2_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country3_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country4_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country5_shipping_with_another_item", :precision => 8, :scale => 2
    t.string   "country1_deliverytime"
    t.string   "country2_deliverytime"
    t.string   "country3_deliverytime"
    t.string   "country4_deliverytime"
    t.string   "country5_deliverytime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic1_file_name"
    t.string   "pic1_content_type"
    t.integer  "pic1_file_size"
    t.datetime "pic1_updated_at"
  end

  create_table "draws", :force => true do |t|
    t.integer  "list"
    t.integer  "seller_id"
    t.string   "login_name"
    t.string   "name"
    t.string   "account_holder"
    t.string   "iban"
    t.string   "bic"
    t.decimal  "balance_now",    :precision => 8, :scale => 2
    t.decimal  "debited",        :precision => 8, :scale => 2
    t.decimal  "difference",     :precision => 8, :scale => 2
    t.string   "fail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "subtitle"
    t.text     "startdate"
    t.text     "enddate"
    t.text     "description"
    t.string   "creator_name"
    t.text     "ticket_deadline"
    t.string   "complete"
    t.string   "orga_name"
    t.string   "orga_website"
    t.string   "orga_email"
    t.string   "name_of_contact1"
    t.string   "street_of_contact1"
    t.string   "area_code_of_contact1"
    t.string   "city_of_contact1"
    t.string   "country_of_contact1"
    t.string   "tel1_of_contact1"
    t.string   "tel2_of_contact1"
    t.string   "description_of_contact1_availability"
    t.string   "fax_of_contact1"
    t.string   "email_of_contact1"
    t.string   "name_of_contact2"
    t.string   "street_of_contact2"
    t.string   "area_code_of_contact2"
    t.string   "city_of_contact2"
    t.string   "country_of_contact2"
    t.string   "tel1_of_contact2"
    t.string   "tel2_of_contact2"
    t.string   "description_of_contact2_availability"
    t.string   "fax_of_contact2"
    t.string   "email_of_contact2"
    t.boolean  "invitation_only"
    t.string   "invitation_code"
    t.string   "location"
    t.string   "street"
    t.string   "area_code"
    t.string   "city"
    t.string   "region"
    t.string   "country"
    t.text     "location_description"
    t.string   "genre"
    t.string   "genre_description"
    t.string   "rules"
    t.string   "rules_description"
    t.string   "catering"
    t.string   "catering_description"
    t.string   "accomodation"
    t.string   "accomodation_description"
    t.string   "campaign"
    t.string   "campaign_description"
    t.integer  "minimum_age"
    t.integer  "ambiente"
    t.integer  "fights"
    t.integer  "battles"
    t.integer  "magic"
    t.integer  "mysteries"
    t.string   "event_status"
    t.integer  "max_sc"
    t.integer  "max_nsc"
    t.integer  "available_sc"
    t.integer  "available_nsc"
    t.boolean  "tickets_available_on_rihhi"
    t.string   "currency"
    t.string   "currency_description"
    t.string   "account_holder_name"
    t.string   "account_number"
    t.string   "bank_identifier"
    t.string   "paypal_account"
    t.string   "url_to_invitation"
    t.string   "uploaded_invitation"
    t.string   "uploaded_image"
    t.string   "link_to_forum_discussion"
    t.string   "status"
    t.text     "created_at"
    t.text     "updated_at"
    t.string   "pic1_file_name"
    t.string   "pic1_content_type"
    t.integer  "pic1_file_size"
    t.datetime "pic1_updated_at"
  end

  create_table "favorites", :force => true do |t|
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "kind_of_feedback"
    t.text     "feedback"
    t.string   "page"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flaggeds", :force => true do |t|
    t.string   "listing_id"
    t.string   "user_id"
    t.string   "flagger_id"
    t.string   "flagger_email"
    t.string   "email_sent"
    t.string   "reason"
    t.string   "deleted"
    t.string   "changed"
    t.string   "closed"
    t.string   "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hearteds", :force => true do |t|
    t.string   "user_id"
    t.string   "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "listing_id"
    t.string   "seller_id"
    t.string   "user_id"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lastcategories", :force => true do |t|
    t.string   "name"
    t.string   "locale"
    t.string   "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", :force => true do |t|
    t.integer  "seller_id"
    t.string   "title"
    t.text     "description"
    t.decimal  "price",                               :precision => 8, :scale => 2
    t.string   "sellerspecific_id"
    t.string   "category_tag"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.integer  "lastcategory_id"
    t.integer  "v"
    t.string   "material_tag"
    t.string   "public_tag"
    t.string   "item_height"
    t.string   "item_width"
    t.string   "item_length"
    t.string   "item_weight"
    t.string   "item_circumference"
    t.string   "item_material_thickness"
    t.string   "country1"
    t.string   "country2"
    t.string   "country3"
    t.string   "country4"
    t.string   "country5"
    t.string   "preparation_time"
    t.decimal  "country1_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country2_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country3_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country4_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country5_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country1_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country2_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country3_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country4_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country5_shipping_with_another_item", :precision => 8, :scale => 2
    t.string   "country1_deliverytime"
    t.string   "country2_deliverytime"
    t.string   "country3_deliverytime"
    t.string   "country4_deliverytime"
    t.string   "country5_deliverytime"
    t.string   "quality"
    t.text     "shipping_comments"
    t.string   "safe_for_larp"
    t.string   "safe_for_reenactment"
    t.string   "percent_of_vat_included"
    t.string   "flagged_status"
    t.string   "removed_reason"
    t.string   "removed"
    t.string   "complete"
    t.string   "creation"
    t.string   "suggested_complements"
    t.string   "favorited_number"
    t.string   "hearted_number"
    t.integer  "nr_of_items_in_stock",                                              :default => 1
    t.string   "autoset_items_to_one",                                              :default => "No"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic1_file_name"
    t.string   "pic1_content_type"
    t.integer  "pic1_file_size"
    t.datetime "pic1_updated_at"
    t.string   "pic2_file_name"
    t.string   "pic2_content_type"
    t.integer  "pic2_file_size"
    t.datetime "pic2_updated_at"
    t.string   "pic3_file_name"
    t.string   "pic3_content_type"
    t.integer  "pic3_file_size"
    t.datetime "pic3_updated_at"
    t.string   "pic4_file_name"
    t.string   "pic4_content_type"
    t.integer  "pic4_file_size"
    t.datetime "pic4_updated_at"
    t.string   "renting"
  end

  create_table "listings_lists", :force => true do |t|
    t.integer "list_id"
    t.integer "listing_id"
    t.text    "comment"
  end

  create_table "lists", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists_listings", :force => true do |t|
    t.integer "list_id"
    t.integer "listing_id"
    t.text    "comment"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "sender_name"
    t.string   "receiver_name"
    t.string   "title"
    t.text     "message"
    t.string   "read",              :default => "No"
    t.string   "sender_archived",   :default => "No"
    t.string   "receiver_archived", :default => "No"
    t.string   "created_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movements", :force => true do |t|
    t.integer  "seller_id"
    t.integer  "code"
    t.decimal  "value",      :precision => 8, :scale => 2
    t.text     "reason"
    t.boolean  "email"
    t.boolean  "dispute"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", :force => true do |t|
    t.string   "seller_id"
    t.string   "user_id"
    t.string   "step"
    t.string   "status"
    t.datetime "date_payment_arrived"
    t.datetime "date_shipped"
    t.datetime "date_buyerfeedback_received"
    t.datetime "date_sellerfeedback_received"
    t.datetime "date_closed"
    t.text     "cancel_reason"
    t.string   "number_of_deliverables"
    t.decimal  "price_of_all_deliverables",    :precision => 8, :scale => 2
    t.decimal  "cost_of_shipping",             :precision => 8, :scale => 2
    t.decimal  "total_cost_of_order",          :precision => 8, :scale => 2
    t.integer  "highest_preparation_time"
    t.string   "user_fullname"
    t.string   "user_address"
    t.string   "user_areacode"
    t.string   "user_city"
    t.string   "user_country"
    t.string   "payment_chosen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "order_id"
    t.integer  "user_id"
    t.integer  "seller_id"
    t.integer  "sellerrating"
    t.integer  "userrating"
    t.string   "sellertext"
    t.string   "usertext"
    t.boolean  "dispute"
    t.boolean  "user_has_rated",   :default => false
    t.boolean  "seller_has_rated", :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "ideal_price"
    t.integer  "quantity"
    t.string   "tags"
    t.string   "materials"
    t.integer  "user_id"
    t.string   "full_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.string   "request_status"
    t.date     "deadline"
    t.date     "expiry_date"
    t.date     "posted_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "searches", :force => true do |t|
    t.string   "title"
    t.string   "event_name"
    t.date     "startdate"
    t.date     "enddate"
    t.string   "country"
    t.string   "orga"
    t.integer  "min_age"
    t.string   "genre"
    t.string   "accomodation"
    t.string   "catering"
    t.string   "status"
    t.string   "rules"
    t.string   "category_id"
    t.string   "subcategory_id"
    t.string   "lastcategory_id"
    t.string   "name"
    t.string   "seller"
    t.string   "min_price"
    t.string   "max_price"
    t.string   "description"
    t.string   "requester"
    t.date     "deadline"
    t.string   "material_tags"
    t.string   "other_tags"
    t.string   "request_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sellers", :force => true do |t|
    t.integer  "user_id"
    t.string   "full_name"
    t.string   "street"
    t.string   "post_code"
    t.string   "city"
    t.string   "area"
    t.string   "country"
    t.integer  "rating"
    t.integer  "number_of_ratings"
    t.integer  "pos"
    t.integer  "neg"
    t.string   "electronic_direct_debit"
    t.string   "account_holder_name"
    t.string   "account_number"
    t.string   "bank_identifier"
    t.decimal  "account_balance",         :precision => 8, :scale => 2
    t.decimal  "turnover",                :precision => 8, :scale => 2
    t.decimal  "last_account_balance",    :precision => 8, :scale => 2
    t.decimal  "lowest_account_balance",  :precision => 8, :scale => 2
    t.string   "account_type"
    t.string   "spoken_languages"
    t.string   "seller_status"
    t.string   "terms_of_service"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", :force => true do |t|
    t.integer  "seller_id"
    t.string   "commercial_seller"
    t.string   "company_name"
    t.string   "tax_number"
    t.string   "percentage_vat"
    t.string   "country1"
    t.string   "country2"
    t.string   "country3"
    t.string   "country4"
    t.string   "country5"
    t.decimal  "country1_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country2_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country3_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country4_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country5_shipping",                   :precision => 8, :scale => 2
    t.decimal  "country1_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country2_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country3_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country4_shipping_with_another_item", :precision => 8, :scale => 2
    t.decimal  "country5_shipping_with_another_item", :precision => 8, :scale => 2
    t.string   "country1_deliverytime"
    t.string   "country2_deliverytime"
    t.string   "country3_deliverytime"
    t.string   "country4_deliverytime"
    t.string   "country5_deliverytime"
    t.text     "shipping_comments"
    t.string   "allow_paypal"
    t.string   "paypal_account"
    t.string   "allow_bank_transfer"
    t.string   "bank_account_holder"
    t.string   "bank_bic"
    t.string   "bank_iban"
    t.string   "allow_cheque"
    t.string   "allow_cash_on_delivery"
    t.string   "shop_image_url"
    t.text     "about_my_shop"
    t.text     "shop_tos"
    t.text     "policy_on_returns_and_refunds"
    t.string   "shop_has_been_setup"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "sizes", :force => true do |t|
    t.integer  "listing_id"
    t.string   "xxs"
    t.string   "xs"
    t.string   "s"
    t.string   "m"
    t.string   "l"
    t.string   "xl"
    t.string   "xxl"
    t.string   "xxxl"
    t.string   "all"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.string   "locale"
    t.string   "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticketorders", :force => true do |t|
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.integer  "vendor_id"
    t.string   "email"
    t.integer  "nr_of_tickets"
    t.string   "t1_first_name"
    t.string   "t1_last_name"
    t.integer  "t1_age"
    t.string   "t1_accomodation"
    t.string   "t1_remark"
    t.boolean  "t1_vegetarian"
    t.boolean  "t1_sani"
    t.string   "t2_first_name"
    t.string   "t2_last_name"
    t.integer  "t2_age"
    t.string   "t2_accomodation"
    t.string   "t2_remark"
    t.boolean  "t2_vegetarian"
    t.boolean  "t2_sani"
    t.string   "t3_first_name"
    t.string   "t3_last_name"
    t.integer  "t3_age"
    t.string   "t3_accomodation"
    t.string   "t3_remark"
    t.boolean  "t3_vegetarian"
    t.boolean  "t3_sani"
    t.string   "t4_first_name"
    t.string   "t4_last_name"
    t.integer  "t4_age"
    t.string   "t4_accomodation"
    t.string   "t4_remark"
    t.boolean  "t4_vegetarian"
    t.boolean  "t4_sani"
    t.string   "t5_first_name"
    t.string   "t5_last_name"
    t.integer  "t5_age"
    t.string   "t5_accomodation"
    t.string   "t5_remark"
    t.boolean  "t5_vegetarian"
    t.boolean  "t5_sani"
    t.string   "t6_first_name"
    t.string   "t6_last_name"
    t.integer  "t6_age"
    t.string   "t6_accomodation"
    t.string   "t6_remark"
    t.boolean  "t6_vegetarian"
    t.boolean  "t6_sani"
    t.string   "t7_first_name"
    t.string   "t7_last_name"
    t.integer  "t7_age"
    t.string   "t7_accomodation"
    t.string   "t7_remark"
    t.boolean  "t7_vegetarian"
    t.boolean  "t7_sani"
    t.string   "t8_first_name"
    t.string   "t8_last_name"
    t.integer  "t8_age"
    t.string   "t8_accomodation"
    t.string   "t8_remark"
    t.boolean  "t8_vegetarian"
    t.boolean  "t8_sani"
    t.string   "t9_first_name"
    t.string   "t9_last_name"
    t.integer  "t9_age"
    t.string   "t9_accomodation"
    t.string   "t9_remark"
    t.boolean  "t9_vegetarian"
    t.boolean  "t9_sani"
    t.string   "t10_first_name"
    t.string   "t10_last_name"
    t.integer  "t10_age"
    t.string   "t10_accomodation"
    t.string   "t10_remark"
    t.boolean  "t10_vegetarian"
    t.boolean  "t10_sani"
    t.date     "arrival_on"
    t.boolean  "terms_and_conditions"
    t.text     "additional_remarks"
    t.string   "status"
    t.string   "step"
    t.decimal  "ticket_price",         :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "total_price",          :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", :force => true do |t|
    t.integer  "event_id"
    t.integer  "seller_id"
    t.string   "name"
    t.date     "valid_from"
    t.date     "valid_until"
    t.text     "description"
    t.integer  "price1",                         :limit => 10, :precision => 10, :scale => 0
    t.integer  "price2",                         :limit => 10, :precision => 10, :scale => 0
    t.integer  "price3",                         :limit => 10, :precision => 10, :scale => 0
    t.integer  "price4",                         :limit => 10, :precision => 10, :scale => 0
    t.integer  "price5",                         :limit => 10, :precision => 10, :scale => 0
    t.date     "price1_deadline"
    t.date     "price2_deadline"
    t.date     "price3_deadline"
    t.date     "price4_deadline"
    t.date     "price5_deadline"
    t.integer  "nr_of_tickets_available_online"
    t.string   "sc_or_nsc"
    t.integer  "nr_of_tickets_sold"
    t.boolean  "has_deal"
    t.boolean  "deal_pickup_at_event"
    t.boolean  "is_shipped"
    t.integer  "shipping_cost_domestic",         :limit => 10, :precision => 10, :scale => 0
    t.integer  "shipping_cost_abroad",           :limit => 10, :precision => 10, :scale => 0
    t.boolean  "ticket_available_on_rihhi"
    t.string   "position"
    t.boolean  "ticket_fullservice"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tlistings", :force => true do |t|
    t.integer  "ticket_id"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "userpages", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "name_p"
    t.string   "status"
    t.string   "status_p"
    t.string   "real_name"
    t.string   "real_name_p"
    t.string   "homepage"
    t.string   "homepage_p"
    t.string   "region"
    t.string   "region_p"
    t.text     "larp_setting"
    t.string   "larp_setting_p"
    t.text     "larp_philosophy"
    t.string   "larp_philosophy_p"
    t.text     "favorite_characters"
    t.string   "favorite_characters_p"
    t.text     "player_group"
    t.string   "player_group_p"
    t.text     "homepage_of_group"
    t.string   "homepage_of_group_p"
    t.text     "relationship"
    t.string   "relationship_p"
    t.text     "about_me"
    t.string   "about_me_p"
    t.text     "looking_for"
    t.string   "looking_for_p"
    t.text     "contact_me"
    t.string   "contact_me_p"
    t.text     "future_cons"
    t.string   "future_const_p"
    t.text     "last_cons"
    t.string   "last_cons_p"
    t.text     "ask_me_about"
    t.string   "ask_me_about_p"
    t.text     "music"
    t.string   "music_p"
    t.text     "books"
    t.string   "books_p"
    t.text     "movies"
    t.string   "movies_p"
    t.text     "other_hobbies"
    t.string   "other_hobbies_p"
    t.text     "what_if_ten_days_left"
    t.string   "what_if_p"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "preferred_language"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "friends_visible"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.integer  "userpower"
    t.boolean  "is_seller"
  end

end

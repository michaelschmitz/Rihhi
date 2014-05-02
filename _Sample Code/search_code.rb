if params[:search]
  @search = Search.new(params[:search])
  @search.save
  #The below is the perfect search
 
  #AWESOME! Check the polymorphic search with joins as in "seller_user_login_like => @search.seller". Impressive!
  search = Listing.search(:removed_eq => "0",
                          :nr_of_items_in_stock_gt => 0,
                          :creation_eq => "completed",
                         :category_id_eq => @search.category_id,
                         :title_like => @search.name,
                         :price_gt => @search.min_price,
                         :price_lt => @search.max_price,
                         :description_like => @search.description,
                         :category_tag_like => @search.other_tags,
                         :seller_user_login_like => @search.seller,
                         :material_tag_like => @search.material_tags
                         )
  @listings =  search.all
end
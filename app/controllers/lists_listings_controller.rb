class ListsListingsController < ApplicationController
  def new
    @list = List.find(params[:id])
    @listing = Listing.find(params[:id])    
  end
  
  def create
    @list = List.find(params[:id])
    @listing.lists << @list
  end
end

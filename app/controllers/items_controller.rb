class ItemsController < ApplicationController
  def index
  end

  def new
    # Create variable with model
    @item = Item.new
  end

  def create
    @item = Item.new

    if @item.save
      # If an items is added, go to homepage
      redirect_to root_path
    else
      # Otherwise, stay in the "new" page
      render 'new'
  end
end

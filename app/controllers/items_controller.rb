class ItemsController < ApplicationController
  def index
    # Store all items in an array and order by date descending
    @items = Item.all.order("created_at DESC")
  end

  def new
    # Create variable with model
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      # If an items is added, go to homepage
      redirect_to root_path
    else
      # Otherwise, stay in the "new" page
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end

end
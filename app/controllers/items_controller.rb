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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      # If item is updated, go to "show" page
      redirect_to item_path(@item)
    else
      # Otherwise, stay in the "edit" page
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end

end
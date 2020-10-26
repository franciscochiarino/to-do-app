class ItemsController < ApplicationController
  # Run find_item method before show, edit and update
  before_action :find_item, only: [:show, :edit, :update, :destroy, :complete]

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
    # before_action will run
  end

  def edit
    # before_action will run
  end

  def update
    # before_action will run

    if @item.update(item_params)
      # If item is updated, go to "show" page
      redirect_to item_path(@item)
    else
      # Otherwise, stay in the "edit" page
      render 'edit'
    end
  end

  def destroy
    # before_action will run

    @item.destroy
    redirect_to root_path
  end

  def complete
    # before_action will run
  end

  private

  def item_params
    params.require(:item).permit(:title, :description)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
class ItemsController < ApplicationController
  def index
  end

  def new
    # Create variable with model
    @item = Item.new
  end

  def create
  end
end

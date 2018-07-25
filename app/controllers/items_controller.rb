class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was added to the list"
      redirect_to current_user
    else
      flash[:error] = "There was an error adding the item. Please try again."
      redirect_to current_user
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end

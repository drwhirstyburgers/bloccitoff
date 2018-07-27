class ItemsController < ApplicationController

  def create
    @item = current_user.items.build(item_params)
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was added to the list"
    else
      flash[:error] = "There was an error adding the item. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end

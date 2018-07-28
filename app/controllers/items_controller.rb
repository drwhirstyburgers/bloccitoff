class ItemsController < ApplicationController

  def create
    @item = current_user.items.build(item_params)
    @new_item = Item.new
    @item.save

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

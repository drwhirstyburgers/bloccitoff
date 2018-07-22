class ItemsController < ApplicationController
  def create
    @item = Item.create(item_params)
    @item.user = current_user

    if @item.save
      flash[:notice] = "To-do was added."
      redirect_to users_show_path
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name)
end

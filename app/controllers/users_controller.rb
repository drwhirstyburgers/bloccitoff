class UsersController < ApplicationController
  respond_to :html, :js

  def show
    @user = current_user
    @new_item = Item.new
    @items = @user.items

    respond_to do |format|
      format.html
      format.js
    end
  end
end

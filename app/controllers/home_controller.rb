class HomeController < ApplicationController
  def index
    @user = current_user
    @user_stocks = current_user.stocks
  end
end

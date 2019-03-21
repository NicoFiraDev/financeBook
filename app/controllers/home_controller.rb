class HomeController < ApplicationController
  def index
    @user = current_user
    @user_stocks = current_user.stocks
    @news = StockQuote::Stock.news('market')
  end
end

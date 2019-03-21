class UserStocksController < ApplicationController

  def create
    stock = Stock.find_by_ticker(params[:stock])
    if stock.blank?
      stock = Stock.search_stock(params[:stock])
      stock = Stock.new(ticker: stock.symbol, name: stock.company_name,
                        primary_exchange: stock.primary_exchange,
                        sector: stock.sector)
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{@user_stock.stock.name} was successfully added to portfolio"
    redirect_to portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id,
                                  stock_id: stock.id).first
    @user_stock.destroy
    flash[:notice] = 'Stock was successfully removed from portfolio'
    redirect_to portfolio_path
  end

end

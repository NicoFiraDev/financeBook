class StocksController < ApplicationController
  
  def search
    if params[:stock].blank?
      flash.now[:alert] = 'You have entered an empty string'
    else
      @stock = Stock.search_stock(params[:stock])
      @news = StockQuote::Stock.news(params[:stock])
      @logo = StockQuote::Stock.logo(params[:stock])
      flash.now[:alert] = 'You have entered an incorrect symbol' unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'home/result' }
    end
  end

  def news
    
  end

end
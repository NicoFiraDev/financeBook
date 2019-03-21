class StocksController < ApplicationController
  
  def search
    if params[:stock].blank?
      flash.now[:alert] = 'You have entered an empty string'
    else
      @stock = Stock.search_stock(params[:stock])
      @news = StockQuote::Stock.news(params[:stock])
      @logo = StockQuote::Stock.logo(params[:stock])
      @saved_stock = Stock.find_by_ticker(params[:stock])
      flash.now[:alert] = 'You have entered an incorrect symbol' unless @stock
    end

    respond_to do |format|
      format.js {render partial: 'shared/result'}
    end
  end

  def show
    @stock = StockQuote::Stock.quote(params[:stock])
    @logo = StockQuote::Stock.logo(params[:stock])
    @news = StockQuote::Stock.news(params[:stock])
  end

end
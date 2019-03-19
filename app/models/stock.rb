class Stock < ApplicationRecord

  def self.search_stock(ticker_symbol)
    StockQuote::Stock.quote(ticker_symbol)
  end

end

class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.search_stock(ticker_symbol)
    StockQuote::Stock.quote(ticker_symbol)
  end

end

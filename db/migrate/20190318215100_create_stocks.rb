class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.string :primary_exchange
      t.string :sector

      t.timestamps
    end
  end
end

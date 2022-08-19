class CreateExchangeRates < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_rates do |t|
      t.integer :year_and_month, null: false
      t.jsonb :exchange_rate_list, null: false

      t.timestamps
    end
  end
end

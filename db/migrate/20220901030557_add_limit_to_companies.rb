class AddLimitToCompanies < ActiveRecord::Migration[7.0]
  def change
    change_column :companies, :name, :string, limit: 30
    change_column :companies, :wage_amount, :decimal, precision: 7, scale: 2
  end
end

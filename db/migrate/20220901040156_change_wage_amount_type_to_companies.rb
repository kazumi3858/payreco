class ChangeWageAmountTypeToCompanies < ActiveRecord::Migration[7.0]
  def change
    change_column :companies, :wage_amount, :float
  end
end

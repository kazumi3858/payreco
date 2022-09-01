class ChangePayAmountTypeToWorks < ActiveRecord::Migration[7.0]
  def change
    change_column :works, :pay_amount, :float
  end
end

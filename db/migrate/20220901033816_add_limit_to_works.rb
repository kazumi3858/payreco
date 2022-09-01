class AddLimitToWorks < ActiveRecord::Migration[7.0]
  def change
    change_column :works, :pay_amount, :decimal, precision: 8, scale: 2
    change_column :works, :memo, :string, limit: 50
  end
end

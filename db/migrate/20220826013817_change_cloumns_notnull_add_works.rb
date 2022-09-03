class ChangeCloumnsNotnullAddWorks < ActiveRecord::Migration[7.0]
  def change
    change_column :works, :date, :date, null: false
  end
end

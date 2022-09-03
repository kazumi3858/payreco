class AddDateToWorks < ActiveRecord::Migration[7.0]
  def change
    add_column :works, :date, :date
  end
end

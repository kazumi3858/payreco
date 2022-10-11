class ChangeWorkingHoursColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :works, :working_hours, nil
  end
end

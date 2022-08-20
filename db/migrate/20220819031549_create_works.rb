class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works, id: :uuid do |t|
      t.datetime :starting_time
      t.datetime :ending_time
      t.integer :break_time
      t.float :working_hours, null: false, default: 0
      t.integer :pay_amount, null: false
      t.string :memo
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :company, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end

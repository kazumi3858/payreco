class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name, null: false
      t.boolean :hourly_wage_system, null: false
      t.integer :wage_amount
      t.string :currency_type, null: false
      t.references :user, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :users, id: :uuid do |t|
      t.string :uid, null: false
      t.string :name, null: false
      t.integer :target_amount

      t.timestamps
    end
  end
end

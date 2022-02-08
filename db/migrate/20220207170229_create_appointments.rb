class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.references :patient, null: false, foreign_key: { to_table: :users }, index: true
      t.references :doctor, null: false, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end

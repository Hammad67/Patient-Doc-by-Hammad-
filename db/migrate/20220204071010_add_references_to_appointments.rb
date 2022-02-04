class AddReferencesToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :doctor, null: false, foreign_key: {to_table: :users}, index: true
    add_reference :appointments, :patient, null: false, foreign_key: {to_table: :users}, index: true
  end
end

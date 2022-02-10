class CreateMedicalRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_records do |t|
      t.integer :patient_bp
      t.integer :patient_weight
      t.string :lab_test
      t.string :dieases
      t.text :dieases_detail
      t.string :lab_test_results
      t.references :patient, null: false, foreign_key: { to_table: :users }, index: true
      t.timestamps
    end
  end
end

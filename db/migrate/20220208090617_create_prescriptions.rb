class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.string :dose_name
      t.string :dosage_frequency
      t.text :dose_detail
      t.references :visit, null: false, foreign_key: true

      t.timestamps
    end
  end
end

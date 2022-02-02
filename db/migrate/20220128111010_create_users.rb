class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :Email
      t.string :phone_number
      t.text :address
      t.string :city
      t.date :dateofbirth

      t.timestamps
    end
  end
end

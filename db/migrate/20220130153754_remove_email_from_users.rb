class RemoveEmailFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :Email, :string
  end
end

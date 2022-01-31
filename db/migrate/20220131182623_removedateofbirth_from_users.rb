class RemovedateofbirthFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :dateofbirth
  end
end

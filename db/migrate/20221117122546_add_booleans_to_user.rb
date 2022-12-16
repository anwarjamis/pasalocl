class AddBooleansToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean
    add_column :users, :subscribed, :boolean
  end
end

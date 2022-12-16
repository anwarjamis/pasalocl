class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :university, null: true, foreign_key: true
    add_reference :users, :career, null: true, foreign_key: true
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :integer
  end
end

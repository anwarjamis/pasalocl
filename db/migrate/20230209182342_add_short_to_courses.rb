class AddShortToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :short, :string
  end
end

class AddCategoryToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :category, :string
  end
end

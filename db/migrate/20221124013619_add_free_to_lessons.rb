class AddFreeToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :free, :boolean
  end
end

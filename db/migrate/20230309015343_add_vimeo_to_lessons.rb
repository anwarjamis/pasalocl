class AddVimeoToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :vimeo, :string
  end
end

class AddLastToViews < ActiveRecord::Migration[7.0]
  def change
    add_column :views, :last_viewed_at, :datetime
  end
end

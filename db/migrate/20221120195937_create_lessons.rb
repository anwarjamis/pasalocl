class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.integer :time
      t.string :title
      t.string :description
      t.references :topic, null: true, foreign_key: true

      t.timestamps
    end
  end
end

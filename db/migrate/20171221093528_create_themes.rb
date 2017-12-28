class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.string :name , null: false
      t.string :color
      t.string :value, null: false
      t.timestamps
    end
  end
end

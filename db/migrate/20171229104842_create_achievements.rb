class CreateAchievements < ActiveRecord::Migration[5.0]
  def change
    create_table :achievements do |t|
      t.string :title , null: false
      t.string :description
      t.string :icon , null: false
      t.date   :date
      t.integer :admin_user_id , index: true , foreign_key: true
      t.timestamps
    end
  end
end


class CreateInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :interests do |t|
      t.string :name , null: false
      t.string :icon , null: false
      t.integer :admin_user_id , index: true , foreign_key: true
      t.timestamps
    end
  end
end

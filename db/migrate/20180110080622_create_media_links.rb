class CreateMediaLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :media_links do |t|
      t.string :name , null: false , index: true
      t.string :url , null:false , index: true
      t.string :icon , null:false , index: true
      t.integer :position , null:false , index: true , default: 0
      t.integer :admin_user_id , foreign_key: true , index: true

      t.timestamps
    end
  end
end

class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :full_name , index: true
      t.string :title , index: true
      t.text   :about
      t.string :email , index: true
      t.string :phone
      t.string :image
      t.string :web_url
      t.string :address
      t.integer :admin_user_id , index: true , foreign_key: true
      t.timestamps
    end
  end
end

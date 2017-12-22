class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name , null: false
      t.string :email , null: false
      t.string :subject , null: false
      t.text   :message
      t.integer :admin_user_id , index: true , foreign_key: true
      t.timestamps
    end
  end
end

class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string  :title , null: false
      t.string  :description
      t.string  :publisher , null: false
      t.date    :publication_date
      t.string  :publication_url
      t.integer :position , default: 0 , null: false
      t.integer :admin_user_id , index: true , foreign_key: true
      t.timestamps
    end
  end
end

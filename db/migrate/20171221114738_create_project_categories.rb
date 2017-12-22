class CreateProjectCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :project_categories do |t|
      t.string  :name     , null: false , index: true
      t.integer :admin_user_id , index: true , foreign_key: true , null: false
      t.integer :position , default: 0 , index:true
      t.timestamps
    end
  end
end

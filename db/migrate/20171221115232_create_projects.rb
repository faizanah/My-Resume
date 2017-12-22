class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :title , null: false
      t.string :url
      t.string :image
      t.text   :summary
      t.text   :tags
      t.integer :admin_user_id , index: true , foreign_key: true
      t.timestamps
    end
    create_table :project_categories_projects , id:false do |t|
      t.integer :project_id , index: true , foreign_key: true
      t.integer :project_category_id , index: true , foreign_key: true
    end
  end
end

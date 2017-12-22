class CreateExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :experiences do |t|
      t.string :job_title , null: false
      t.string :organization_name , null: false
      t.string :organization_url
      t.date   :period_start
      t.date   :period_end
      t.text   :summary
      t.integer :admin_user_id , index: true , foreign_key: true
      t.timestamps
    end
  end
end

class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :degree , null: false
      t.string :school_name , null: false
      t.string :school_url
      t.string :grade
      t.date   :period_start
      t.date   :period_end
      t.text   :summary
      t.integer :admin_user_id , index: true , foreign_key: true
      t.timestamps
    end
  end
end

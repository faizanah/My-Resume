class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.integer  "listable_id" , index: true
      t.string   "listable_type" , index: true
      t.text   "description",  null: false
      t.timestamps
    end
  end
end

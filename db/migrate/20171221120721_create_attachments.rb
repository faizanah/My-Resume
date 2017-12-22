class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.integer  "attached_item_id" , index: true
      t.string   "attached_item_type" , index: true
      t.string   "attachment",         null: false
      t.string   "original_filename"
      t.string   "content_type"
      t.timestamps
    end
  end
end

class CreateUserContents < ActiveRecord::Migration[5.0]
  def change
    create_table :user_contents do |t|
      t.references :admin_user
      t.references :content
      t.integer :position , default: 0
      t.boolean :is_visible , default: false
      t.timestamps
    end
  end
end

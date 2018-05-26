class AddLogoToExperience < ActiveRecord::Migration[5.0]
  def change
    add_column :experiences, :logo, :string
    add_column :experiences, :organization_description, :text
    remove_column :experiences, :summary, :text
  end
end

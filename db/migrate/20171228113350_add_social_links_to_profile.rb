class AddSocialLinksToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :theme_id, :integer, index: true , foreign_key: true
    add_column :profiles, :linkedin_url, :string, index: true
    add_column :profiles, :map_url, :string, index: true
    add_column :profiles, :facebook_url, :string, index: true
  end
end

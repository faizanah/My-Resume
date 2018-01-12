class RemoveSocialLinksFromProfile < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :linkedin_url, :string
    remove_column :profiles, :facebook_url, :string
    remove_column :profiles, :git_url, :string
  end
end

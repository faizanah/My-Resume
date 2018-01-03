class AddGitUrlToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :git_url, :string
  end
end

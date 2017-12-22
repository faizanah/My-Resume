class AddResumeToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :resume, :string
  end
end

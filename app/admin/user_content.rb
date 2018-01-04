ActiveAdmin.register UserContent do
  actions :all, :except => [:destroy , :new , :create , :edit , :show]
  config.filters = false
  permit_params :is_visible
  config.sort_order = 'position_asc'
  config.paginate   = false
  # menu false
  menu label: "Configuration" ,  priority: 102
  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id).includes(:content)
    end
  end


  reorderable

  # Reorderable Index Table
  index as: :reorderable_table , download_links: false do
    column "Name" do |user_content|
      user_content.content.name
    end
    column "Visible" , :is_visible do |project|
      best_in_place project, :is_visible, as: :checkbox, url: [:admin, project],   collection: { false: raw("<span class='status_tag in_progress'>Hide</span>"), true: raw("<span class='status_tag active ok'>Show</span>") }
    end
  end

end

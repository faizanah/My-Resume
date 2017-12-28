ActiveAdmin.register Contact do
  actions :all, :except => [:destroy , :new , :create , :update , :edit]
  permit_params :name ,:email, :message, :subject

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end
  end

  index do |org|
    column :name
    column :subject
    column :email
    actions
  end


end

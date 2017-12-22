ActiveAdmin.register Contact do
  actions :all, :except => [:destroy , :new , :create , :update , :edit]
  permit_params :name ,:email, :message, :subject

  index do |org|
    column :name
    column :subject
    column :email
    actions
  end


end

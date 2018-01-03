ActiveAdmin.register Publication do
  actions :all

  menu priority: 100
  permit_params :title , :description , :publisher , :publication_date , :publication_url
  reorderable
  before_create do |publication|
    publication.admin_user_id = current_admin_user.id
  end

  controller do
    def scoped_collection
      super.where(admin_user_id: current_admin_user.id)
    end

    def find_resource
      scoped_collection.where(id: params[:id]).first!
    end
  end

  config.filters = false

  index  as: :reorderable_table ,download_links: false do |org|
    column  :title do |publication|
      best_in_place publication, :title, url: [:admin, publication]
    end
    column  :publisher do |publication|
      best_in_place publication, :publisher, url: [:admin, publication]
    end
    column :publication_date
    actions
  end

  show do
    attributes_table do
      row  :title do |publication|
        best_in_place publication, :title, url: [:admin, publication]
      end
      row :publisher
      row :publication_date
      row :publication_url
      row :description
      row :created_at
      row :updated_at
    end
  end
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Publication Details" do
      f.input :title , label: "Title"
      f.input :publisher
      f.input :publication_date
      f.input :publication_url
      f.input :description , as: :text
    end
    f.actions
  end

end

ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Contacts Us" do
          table do
            thead do
              tr do
                %w[Name Subject Email Message Created At].each &method(:th)
              end
            end
            tbody do
              current_admin_user.contacts.recent.each do |contact|

                #       content_tag :ul do
                #         Post.recent(5).collect do |post|
                #           content_tag(:li, link_to(post.title, admin_post_path(post)))
                #         end.join.html_safe
                #       end
                tr do
                  td (contact.name)
                  td do
                    link_to(contact.subject, admin_contact_path(contact))
                  end
                  td (contact.email)
                  td (contact.message)
                  td (contact.created_at)
                end
              end
            end
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end

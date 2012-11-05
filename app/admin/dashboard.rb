ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Feeds" do
          ul do
            Article.order(:created_at).limit(10).map do |post|
              li link_to(post.title, admin_article_path(post))
            end
          end
        end
      end
    end
  end
end

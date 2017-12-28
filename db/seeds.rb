Theme.create!(Resume::Application::THEMES)
Content.create!(Resume::Application::CONTENT_LIST)
AdminUser.create! do |r|
  r.email      = 'admin@example.com'
  r.password   = 'password'
  r.superadmin = true
end
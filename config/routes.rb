# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

RedmineApp::Application.routes.draw do
  match 'gitlab_tracking/webhook_parsing', :to => 'gitlab_tracking#webhook_parsing', :via => [:post]
end

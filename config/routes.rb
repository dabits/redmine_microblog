ActionController::Routing::Routes.draw do |map|
  map.resources :microblogs, :controller => :microblogs, :collection => [:index_project, :more_recent, :more_history]
  map.connect 'projects/:project_id/microblogs/:action', :controller => :microblogs, :action => :index_project
end
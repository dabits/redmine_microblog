RedmineApp::Application.routes.draw do
  resources :microblogs do
    get :more_recent, :on => :collection
    get :more_history, :on => :collection
    get :more_recent_project, :on => :collection
    get :more_history_project, :on => :collection
    get :index_project, :on => :collection
  end
end
require 'redmine'

Redmine::Plugin.register :redmine_microblog do
  name 'Redmine Microblog plugin'
  author 'dabits'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://github.com/dabits/redmine_microblog'
  author_url 'http://www.dabits.net/'

  permission :microblog_view, :microblogs => :index
  permission :microblog_create, :microblogs => :create
  permission :microblog_destroy, :microblogs => :destroy
  project_module :redmine_microblog do
    permission :microblog_project_view, :microblogs => [:index_project, :more_recent_project, :more_history_project]
  end
  
  menu :top_menu, :microblogs, { :controller => :microblogs, :action => :index }, :caption => :microblog
  menu :project_menu, :microblogs, { :controller => :microblogs, :action => :index_project },
  :caption => :microblog, :param => :project_id
end

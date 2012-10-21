class Microblog < ActiveRecord::Base
  unloadable
  belongs_to :project
  belongs_to :user
  default_scope :order => 'created_at DESC'
  
  named_scope :visible, lambda {|project_id|
    unless project_id
      @memberships = User.current.memberships.all(:conditions => Project.visible_condition(User.current))
      project_ids = @memberships.map{|m| m.project.id} || []
      {:conditions => ['project_id IS NULL OR project_id IN (?)', project_ids.join(',')], :limit => 10}
    else
      {:conditions => {:project_id => project_id}, :limit => 10}
    end
  }
  named_scope :more_recent, lambda {|id| {:conditions => ['id > ?', id]}}
  named_scope :more_history, lambda {|id| {:conditions => ['id < ?', id]}}
end

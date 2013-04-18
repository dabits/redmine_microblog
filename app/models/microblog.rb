class Microblog < ActiveRecord::Base
  unloadable
  belongs_to :project
  belongs_to :user
  default_scope :order => 'created_at DESC'
  
  scope :visible, Proc.new {|project|
    if project.instance_of?(Array)
      project_ids = project.map{|m| m.id} || []
      {:conditions => ['project_id IS NULL OR project_id IN (?)', project_ids]}
    elsif !project.blank?
      {:conditions => {:project_id => project.id}}
    else
      {:conditions => ['project_id IS NULL']}
    end
  }
  scope :more_recent, lambda {|id| {:conditions => ['id > ?', id]}}
  scope :more_history, lambda {|id| {:conditions => ['id < ?', id]}}
  scope :obvious_limit, {:limit => 10}
end

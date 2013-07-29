class Task < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :template
  belongs_to :super_task, :class_name => 'Task'
  has_many :sub_tasks, :class_name => 'Task', :foreign_key => :super_task_id
  has_many :ownerships
  has_many :sub_templates, :class_name => 'Template', :foreign_key => :parent_task_id
  has_many :owners, :through => :ownerships, :class_name => 'User'

  delegate :next_actions, :to => :state

  belongs_to :state

  def max_points
    4
  end
end

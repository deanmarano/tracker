class Task < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :template
  belongs_to :super_task, :class_name => 'Task'
  has_many :sub_tasks, :class_name => 'Task', :foreign_key => :super_task_id
  has_many :ownerships
  has_many :sub_templates, :class_name => 'Template', :foreign_key => :parent_task_id
  has_many :owners, :through => :ownerships, :source => :user

  delegate :next_actions, :to => :current_state

  belongs_to :state

  def add_owner(user)
    Ownership.create(:user => user, :task => self)
  end

  def max_points
    4
  end

  def current_state
    state || template.initial_state
  end

  def all_sub_templates
    sub_templates + Template.where(:parent_task_id => nil)
  end
end

class Template < ActiveRecord::Base
  belongs_to :parent_task, :class_name => 'Task'
  serialize :options

  def initialize(attributes)
    super
    self.options ||= {}
  end

  def has_acceptance_criteria?
    !!self.options[:acceptance_criteria]
  end
end

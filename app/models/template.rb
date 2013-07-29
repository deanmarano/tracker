class Template < ActiveRecord::Base
  belongs_to :parent_task, :class_name => 'Task'
  belongs_to  :initial_state, :class_name => 'State'
  serialize :options

  def initialize(attributes)
    super
    self.options ||= {}
  end

  def has_acceptance_criteria?
    !!self.options[:acceptance_criteira]
  end

  def possible_states
    states = []
    next_states = [initial_state]
    while next_states.present?
      states += next_states
      next_states = next_states.map(&:next_actions).flatten.map(&:resulting_state).flatten.compact.uniq.reject { |state| states.include?(state) }
    end

    states
  end
end

class State < ActiveRecord::Base
  serialize :next_action_ids

  def next_actions
    @next_actions ||= Action.where(:id => next_action_ids)
  end

  def reload
    super
    @next_actions = nil
  end
end

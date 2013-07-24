class State < ActiveRecord::Base
  serialize :next_action_ids

  def next_actions
    @next_actions = Action.find_all_by_id(next_action_ids)
  end
end

class State < ActiveRecord::Base
  serialize :next_action_ids
end

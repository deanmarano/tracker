class Action < ActiveRecord::Base
  belongs_to :resulting_state, :class_name => 'State'
end

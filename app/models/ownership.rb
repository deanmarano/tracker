class Ownership < ActiveRecord::Base
  belongs_to :task
  belongs_to :user, :class_name => 'User', :foreign_key => :user_id
end

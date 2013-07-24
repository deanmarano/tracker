class Task < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  belongs_to :template

  belongs_to :state
end

class User < ActiveRecord::Base
  has_one :root_task, :class_name => 'Task', :foreign_key => 'author_id'

  def name
    display_name || "#{first_name} #{last_name}"
  end
end

class User < ActiveRecord::Base

  def name
    display_name || "#{first_name} #{last_name}"
  end
end

class Contact < ApplicationRecord
  belongs_to :user
  def pretty_time
    return created_at.strftime("%a, %r %b %y")
  end
  
  def add_japan
    return "+81"
  end

  def full_name
    return first_name + " " + last_name
  end
end

class User
  def initialize(user_id)
    @id = user_id
    @slack_handle
    @shift
  end

  def id
    return @id
  end
  # each user will have shifts

  def add_shift(shift)
    @shift = shift
  end

  def shift
    return @shift
  end
end

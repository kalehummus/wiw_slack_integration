class Shift
  attr_accessor :user_id
  attr_accessor :shift_description
  attr_accessor :position_id
  attr_accessor :shift_start
  attr_accessor :shift_end
  attr_accessor :first_name

  def initialize(shift_start, shift_end, position_id,user_id)
    @start_time = shift_start
    @end_time = shift_end
    @position_id = position_id
    @user_id = user_id
    @shift_description #frm positions
    @first_name #from users
  end
end

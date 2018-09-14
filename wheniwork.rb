###### using https://github.com/parcelbright/wheniwork
require 'wheniwork'
require './user.rb'
require './shift.rb'
load '.env'
# require './slack_handles.rb'

WhenIWork.configure do |c|
  c.username = WIW_USERNAME
  c.password = WIW_PASSWORD
  c.api_key =  WIW_API_KEY
end

client = WhenIWork::Client.new


response = client.shifts()
# p response.to_json


shifts = response["shifts"]
positions = response["positions"]
users = response["users"]


users.each do |user|

#  p user["first_name"]#, user["last_name"], user["id"]
  # p user["first_name"]
end

# shifts is an array of all the shift hashes

def shift_start_next_half_hour(shift_start_time)
  time = Time.now
  next_half_hour = time + 30*60
  if shift_start_time > time and shift_start_time < next_half_hour
    return true
  else
    return false
  end
end


# next_shift_start = DateTime.new(2018, 8, 3, 20, 30, 0)
shifts_that_start_soon = Array.new

shifts.each do |shift|
  shift_start = DateTime.parse(shift["start_time"]).to_time
  if shift_start_next_half_hour(shift_start)
    shifts_that_start_soon << Shift.new(shift["start_time"],shift["end_time"],shift["position_id"],shift["user_id"])
  end
end


shifts_that_start_soon.each do |shift|
  users.each do |user|
    # p shift.user_id
    # p user["id"]
    if shift.user_id == user["id"]
      shift.first_name = user["first_name"]
      # p user["first_name"]
    end
  end
  positions.each do |position|
    if shift.position_id == position["id"]
      shift.shift_description = position["name"]
    end
  end
end



p shifts_that_start_soon
# ------
# users = response["users"]
#
# users.each do |user|
#   if shifts_that_start_soon.key?(user["id"])
#     puts "the user id is #{user['id']}; the first name is #{user['first_name']}"
#   # p user["first_name"]
#   # p user["id"]
#   end
# end
#
# positions.each do |position|
#   if shifts_that_start_soon.key?(position["id"])
#     puts position["name"]
#   end
# end

require '/Users/nidshah/Desktop/braintree/wiw/user'
require '/Users/nidshah/Desktop/braintree/wiw/shift'

my_user = User.new(9203)
users_shift = Shift.new(5, 6, "a shift called 7", "weru2039")
my_user.add_shift(users_shift)

p my_user

p my_user.shift.class
p my_user.shift

p my_user.id

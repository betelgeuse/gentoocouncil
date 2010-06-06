# helper for feature test

# helper method for user steps
def login_as(role)
	user = User.create!(
		:name => 'kktest3',
		:login => 'kktest3@kktest3.com',
		:password => 'kktest3',
		:password_confirmation => 'kktest3',
		:role => :developer # will be ignored
	)
	user.role = role
	user.save!
	user
end

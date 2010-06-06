Given /^I am a visitor$/ do
	When 'I am on the home page'
	Then 'I should not see "Logged in as"'
end

Given /^I am logged in as a (.+)$/ do |user|
	@user = login_as(user.gsub(/\s/, '_').to_sym)
	visit user_login_path
	When %Q{I fill in "login" with "#{@user.email_address}"}
	And 'I fill in "password" with "kktest3"'
	And 'I press "Log in"'
end

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

Given /^(?:|I )am logged in$/ do
	Given "I am logged in as a developer"
end

And /^(?:|I )am not a council member$/ do
	if (@user.role.to_sym == :council_member)
		Given "I am logged in as a developer"
	end
end

Then /^I should be able to configure how early to receive email notification$/ do
	When "I configured to receive email notification 2 weeks in advance"
end

When /^I configured to receive email notification 2 weeks in advance$/ do
	visit edit_user_path(@user)
	When %Q{I fill in "user_notify_in_advance" with "#{2 * 7 * 24}"}
	And 'I press "Save"'
	Then 'I should see "were saved"'
end

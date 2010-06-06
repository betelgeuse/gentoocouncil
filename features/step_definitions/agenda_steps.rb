# agenda creation testing is already covered in other steps.
# let's speed up the test by directly modifying the Model
Given /^agenda "([^\"]*)" exists$/ do |agenda_name|
	@agenda = agendas(:agenda_one)
	if @agenda.name != agenda_name
		@agenda.update_attributes(:name => agenda_name)
	end
end

# avoid repetition in agenda.features
Given /^I visit agendas as a (.+)$/ do |user|
	Given "I am logged in as a #{user}"
	And 'I am on the home page'
	When 'I follow "Agendas"'
end

When /^the next meeting is (.+) 2 weeks from now$/ do |time|
	@agenda = agendas(:agenda_one)
	case time
	when 'over'
		@agenda.update_attributes(:start_at => 15.days.from_now)
	when 'under'
		@agenda.update_attributes(:start_at => 10.days.from_now)
	when 'exactly'
		@agenda.update_attributes(:start_at => 2.weeks.from_now)
	end
end

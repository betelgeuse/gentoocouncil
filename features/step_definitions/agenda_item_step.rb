When /^I visit agenda item "([^\"]*)"$/ do |agenda_item|
	Given 'I go to the home page'
	And 'I follow "Agenda Items"'
	And %Q{I follow "#{agenda_item}"}
end

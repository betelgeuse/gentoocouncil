Given /^I have a GLEP submitted to the editors$/ do
	@glep = @user.gleps.build(:name => 'glep1', :description => 'glep 1')
	@glep.save
end

# prepare required glep data
Given /^glep "([^\"]*)" has been discussed on mailing lists for over 2 weeks$/ do |glep_name|
	@glep = Glep.find_by_name(glep_name)
	@glep.status = :discussed
	@glep.save
end

# still not sure how we would auto-handle actions below. Will mock the actions in the test myself.
Then /^the GLEP should be added to the agenda of the next meeting$/ do
	agenda_item = @agenda.agenda_items.build(:name => '[GLEP]' + @glep.name,
																					 :description => @glep.description)
	agenda_item.save
end

Then /^the GLEP should be left waiting for the next meeting over 2 weeks from now$/ do
	@glep.status = :waiting
	@glep.save
end

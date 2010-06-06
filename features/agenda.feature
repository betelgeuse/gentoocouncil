Feature: Basic Agenda Creation
  As a council member
	I want to use the webapp to create agendas
	in order to make my life easier

	Background:
		Given agenda "agenda_test_name" exists

	Scenario: Guest operations
		When I am on the home page
		And I follow "Agendas"
		And I follow "agenda_test_name"
		Then I should see "agenda_test_name"
		And I should not see "Edit Agenda"

	Scenario: Council member creates agenda
		Given I visit agendas as a council member
		When I follow "New Agenda"
		And I fill in "agenda_name" with "another_agenda_name"
		And I press "Create Agenda"
		Then I should see "created successfully"
		When I go to the home page
		And I follow "Agendas"
		Then I should see "another_agenda_name"

	Scenario: Council member edits agenda
		Given I visit agendas as a council member
		When I follow "agenda_test_name"
		And I follow "Edit Agenda"
		And I fill in "agenda_name" with "agenda_name_modified"
		And I press "Save"
		Then I should see "were saved"
		When I go to the home page
		And I follow "Agendas"
		Then I should see "agenda_name_modified"

	Scenario: Council member deletes agenda
		Given I visit agendas as a council member
		When I follow "agenda_test_name"
		And I follow "Edit Agenda"
		And I press "Remove This Agenda"
		Then I should see "was deleted"
		When I go to the home page
		Then I should not see "agenda_modified"

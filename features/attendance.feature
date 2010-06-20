Feature: Record meeting attendance
  As a council member
	I want to record attendance for each meeting

	Scenario: Record attendance
		Given agenda "agenda_test_name" exists
		And I visit agendas as a council member
		When I follow "agenda_test_name"
		And I press "Attend"
		Then I should see "successfully"

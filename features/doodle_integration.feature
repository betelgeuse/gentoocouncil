Feature: Dooble integration
  As a council member
  I want to easily match my schedules with others
  so that meetings are in the best possible time for everyone

  Scenario: Starting a new doodle
		Given I am logged in as a council member
		When I go to the home page
		And I follow "Doodles"
		And I follow "New Doodle"
		And I fill in "doodle[name]" with "name3"
		And I fill in "doodle[description]" with "description3"
		And I press "Create Doodle"
		Then I should see "successfully"

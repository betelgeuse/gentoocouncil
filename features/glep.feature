Feature: GLEP work flow
  As a council member
  I want the webapp to track GLEP submissions
  so that due attention is paid to them
 
  Background: Developer with a GLEP
    Given I am logged in as a developer
		When I go to the home page
		And I follow "Gleps"
		And I follow "New Glep"
		And I fill in "glep_name" with "glep_test_name"
		And I press "Create Glep"
		Then I should see "successfully"

    Given glep "glep_test_name" has been discussed on mailing lists for over 2 weeks

  Scenario: Next meeting over 2 weeks from now
    When the next meeting is over 2 weeks from now
    Then the GLEP should be added to the agenda of the next meeting

  Scenario: Next meeting under 2 weeks from now
    When the next meeting is under 2 weeks from now
    Then the GLEP should be left waiting for the next meeting over 2 weeks from now

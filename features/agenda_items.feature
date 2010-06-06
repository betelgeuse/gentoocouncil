Feature: Propose Agenda Items
  As a developer
  I want to be able to propose agenda items
  so that council makes decisions on them

  Scenario: Propose Agenda items
    Given I am logged in as a developer
		When I go to the home page
		And I follow "Agenda Items"
		And I follow "New Agenda Item"
		And I fill in "agenda_item_name" with "agenda_item_test_name"
		And I press "Create Agenda Item"
		Then I should see "created successfully"

  Scenario: Approve Agenda items
    Given I am logged in as a council member
    When I visit agenda item "agenda_item_unapproved"
		And I press "Approve"
    Then I should see "successfully"

  Scenario: Disapprove Agenda item
    Given I am logged in as a council member
		When I visit agenda item "agenda_item_unapproved"
		And I fill in "agenda_item_reason_of_disapproval" with "not allowed"
		And I press "Disapprove"
		Then I should see "successfully"

		When I visit agenda item "agenda_item_unapproved"
		Then I should see "not allowed"

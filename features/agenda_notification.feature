Feature: Agenda Email Notification
  As a council member
	I want to be able to receive email notification about incomming meeting
 
  Background: Council Member with Agenda
    Given I am logged in as a council member

	Scenario: Configure how early to receive email notification
		Then I should be able to configure how early to receive email notification

  Scenario: Receiving email notification
    When the next meeting is exactly 2 weeks from now
		And I configured to receive email notification 2 weeks in advance
		Then I should receive a delayed email

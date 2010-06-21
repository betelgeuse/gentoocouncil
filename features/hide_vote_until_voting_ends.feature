Feature: Hide vote until voting ends
  As a council member
	I want my vote to be hidden until everyone has voted
	So that they are not influenced by my vote

	Scenario: Hide vote until voting ends
		Given I am logged in as a council member
		And voting is not finished
		Then I should not be able to view others' votes

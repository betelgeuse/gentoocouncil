require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Agenda do
	before(:each) do
		@agenda = agendas(:agenda_one)
	end

	it "should allow guest to view" do
		@agenda.should be_viewable_by(users(:guest))
	end

	it "should allow council member to create" do
		Agenda.new(
			:name => 'agenda3',
			:description => 'agenda 3'
		).should be_creatable_by(users(:council_member))
	end

	it "should not allow guest to update" do
		@agenda.should_not be_updatable_by(users(:guest))
	end

	it "should allow council member to edit" do
		@council_member = users(:council_member)
		agenda = agendas(:agenda_one)
		agenda.should be_updatable_by(@council_member)
	end
end

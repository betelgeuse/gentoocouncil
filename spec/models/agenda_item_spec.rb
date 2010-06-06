require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AgendaItem do
	before(:each) do
		@agenda_item = agenda_items(:agenda_item_one)
	end

	it "should allow guest to view" do
		@agenda_item.should be_viewable_by(users(:guest))
	end

	it "should allow signed up members to create" do
		agenda_item = AgendaItem.new(
			:name => 'agenda_item1',
			:description => 'agenda item 1'
		)
		agenda_item.should be_creatable_by(users(:developer))
	end

	it "should not allow developer or guest to update" do
		[:developer, :guest].each do |role|
			@agenda_item.should_not be_updatable_by(users(role))
		end
	end
	
	it "should allow council member to update" do
		@council_member = users(:council_member)
		@agenda_item.should be_updatable_by(@council_member)
	end
end

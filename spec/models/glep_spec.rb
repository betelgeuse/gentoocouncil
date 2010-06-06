require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Glep do
	before(:each) do
		@glep = gleps(:glep_one)
	end

	it "should allow anyone to view" do
		[:guest, :developer, :council_member, :admin].each do |role|
			@glep.should be_viewable_by(users(role))
		end
	end

	it "should allow developer to create" do
		glep = Glep.new(
			:name => 'glep_1',
			:description => 'glep 1'
		)
		glep.should be_creatable_by(users(:developer))
	end

	it "should allow council member to update" do
		@council_member = users(:council_member)
		@glep.should be_updatable_by(@council_member)
	end
end

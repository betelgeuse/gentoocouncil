require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
describe Doodle  do
	# will use mock later
	def new_doodle
		Doodle.new(
			:name => 'doodle1',
			:description => 'doodle 1'
		)
	end

	before(:each) do
		@doodle = doodles(:doodle_one)
	end

	it "should allow anyone to view" do
		[:guest, :developer, :council_member, :admin].each do |role|
			@doodle.should be_viewable_by(users(role))
		end
	end

	it "should allow council member to create" do
		new_doodle.should be_creatable_by(users(:council_member))
	end

	it "should allow council member to update" do
		@doodle.should be_updatable_by(users(:council_member))
	end

	it "should not allow developer or guest to create" do
		[:developer, :guest].each do |role|
			new_doodle.should_not be_creatable_by(users(role))
		end
	end

	it "should not allow developer or guest to update" do
		[:developer, :guest].each do |role|
			new_doodle.should_not be_updatable_by(users(role))
		end
	end


end

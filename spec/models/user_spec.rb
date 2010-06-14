require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
	before(:each) do
		@admin = users(:admin)
		@other_user = users(:developer)
	end

  it "should be administrator" do
		@admin.should be_administrator
  end

	it "should not be administrator" do
		@other_user.should_not be_administrator
	end

	it "should be able to become administrator" do
		@other_user.role = :admin
		@other_user.should be_valid
		@other_user.should be_administrator
	end

	it "should reject invalid role" do
		@other_user.role = :fake_role
		@other_user.should_not be_valid
	end

	it "role should be updatable by administrator" do
		@other_user.should be_updatable_by(@admin)
	end

	[:council_member, :guest].each do |role|
		it "should not be updatable by a user with role #{role}" do
			@other_user.role = role
			@other_user.should_not be_updatable_by(@other_user)
		end
	end

end

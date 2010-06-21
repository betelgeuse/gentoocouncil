Given /^voting is not finished$/ do
	@question = questions(:question)
	council_members_count = User.find(:all, :conditions => {:role => 'council_member'}).count
	@question.votes.count.should < council_members_count
end

Then /^I should not be able to view others' votes$/ do
	my_vote = @question.votes.find(:first, :conditions => {:owner_id => @user.id}) || []
	(@question.votes - my_vote).each do |vote|
		vote.should_not be_viewable_by(@user)
	end
end

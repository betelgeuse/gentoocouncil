require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Vote do
  it "should allow voting only once" do
    q = questions(:question)
    u = users(:councilmember)
    v = q.votes.build(:support => false, :reasoning => 'bad', :user => u)
    v.should be_valid
    v.creatable_by?(u).should be_true
    q.save

    v = Vote.new(:support => false, :reasoning => 'bad', :user => u, :question => q)
    v.should be_invalid
    v.creatable_by?(u).should be_false
  end
end

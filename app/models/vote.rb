class Vote < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    support :boolean
    reasoning :text
    timestamps
  end

  belongs_to :owner, :class_name => 'User', :creator => true
  belongs_to :question
  validates_presence_of :owner, :question
  never_show :owner
  validates_uniqueness_of :owner_id, :scope => :question_id

  # --- Permissions --- #

  def create_permitted?
    return false if question.votes.find_by_owner_id(owner_id)
    acting_user.signed_up?
  end

  def update_permitted?
    return false if user_changed?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
		# TODO: must have a mechanism to mark whether voting is finished or not
		if question.votes.count < User.find(:all, :conditions => {:role => 'council_member'}).count
			return false
		else
			return true
		end
  end

end

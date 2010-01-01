class Vote < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    support :boolean
    reasoning :text
    timestamps
  end

  belongs_to :user, :creator => true
  belongs_to :question
  validates_presence_of :user, :question
  never_show :user
  validates_uniqueness_of :user_id, :scope => :question_id

  # --- Permissions --- #

  def create_permitted?
    return false if question.votes.find_by_user_id(user_id)
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
    true
  end

end

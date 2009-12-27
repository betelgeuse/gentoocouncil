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

  # --- Permissions --- #

  def create_permitted?
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

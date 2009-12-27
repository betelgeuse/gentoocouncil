class Question < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    question :text
    timestamps
  end

  belongs_to :creator, :class_name => "User", :creator => true
  attr_readonly :creator
  never_show :creator
  has_many :votes

  # --- Permissions --- #

  def create_permitted?
    acting_user.signed_up?
  end

  def update_permitted?
    acting_user.administrator?
    false
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end

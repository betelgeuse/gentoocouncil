class Glep < ActiveRecord::Base

  hobo_model # Don't put anything above this
	status_type = HoboFields::EnumString.for(:pending, :discussed, :waiting, :approved)

  fields do
    name        :string, :required
    description :text
    status     status_type, :default => :pending, :limit => 20
    timestamps
	end

	belongs_to :owner, :class_name => 'User', :creator => true

	validates_presence_of :owner

	# --- Permissions --- #

  def create_permitted?
		acting_user.signed_up? and ([:admin, :council_member, :developer].include?(acting_user.role.to_sym))
  end

  def update_permitted?
		allowed_to_admin?
  end

  def destroy_permitted?
		allowed_to_admin?
  end

  def view_permitted?(field)
    true
  end

protected
	def allowed_to_admin?
		(acting_user.signed_up?) and ([:admin, :council_member].include?(acting_user.role.to_sym))
	end
end

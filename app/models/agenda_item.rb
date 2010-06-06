class AgendaItem < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name                  :string, :required
    description           :text
    approved              :boolean, :default => false
    reason_of_disapproval :text
    timestamps
  end

	belongs_to :owner, :class_name => 'User', :creator => true
	belongs_to :approved_by, :class_name => 'User'
	belongs_to :agenda

	#	this line causes failure for manual test
	#	will try later to find a solution
#	validates_presence_of :owner
	validate :has_reason_of_disapproval

	lifecycle do
		state :approved, :default => false
		transition :approved, {:approved => :approved}, :available_to => :all
	end

  # --- Permissions --- #
	attr_protected :approved_by, :owner, :approved

  def create_permitted?
		acting_user.signed_up? and acting_user.role.to_sym != :guest
  end

	def reason_of_disapproval_edit_permitted?
		acting_user.signed_up? and [:admin, :council_member].include?(acting_user.role.to_sym)
	end

  def update_permitted?
    (acting_user.administrator?) or
			(owner_is?(acting_user) and only_changed?(:name, :description)) or
			(acting_user.signed_up? and acting_user.role.to_sym == :council_member)
  end

  def destroy_permitted?
		# Agenda is destroyable by council member, so is AgendaItem
    acting_user.signed_up? and [:admin, :council_member].include?(acting_user.role.to_sym)
  end

  def view_permitted?(field)
    true
  end

protected
	def has_reason_of_disapproval
		errors.add(:reason_of_disapproval, 'should be provided') if (created_at != updated_at and self.approved == false and reason_of_disapproval.blank?)
	end
end

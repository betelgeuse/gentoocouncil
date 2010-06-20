require 'permission'

class Agenda < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string, :required
    description :text
    timestamps
  end

	belongs_to :owner, :class_name => 'User', :creator => true
	has_many :agenda_items, :dependent => :destroy
	has_one :doodle
	has_many :attendances, :dependent => :destroy
	has_many :users, :through => :attendances

	# this causes failure if use yml data feed. Will fix later
	#validates_presence_of :owner

  # --- Permissions --- #
	never_show :owner

	multi_permission(:create, :update, :destroy) do
		acting_user.signed_up? and [:admin, :council_member].include?(acting_user.role.to_sym)
	end

  def view_permitted?(field)
    true
  end
end

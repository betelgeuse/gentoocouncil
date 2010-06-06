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

	validates_presence_of :owner

  # --- Permissions --- #
	never_show :owner

	multi_permission(:create, :update, :destroy) do
		acting_user.signed_up? and [:admin, :council_member].include?(acting_user.role.to_sym)
	end

  def view_permitted?(field)
    true
  end
end

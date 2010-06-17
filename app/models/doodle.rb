require 'permission'

class Doodle < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name        :string, :required
    description :text
    url         :string
    admin_url   :string
    timestamps
  end

	belongs_to :owner, :class_name => 'User', :creator => true
	belongs_to :agenda

  # --- Permissions --- #

	multi_permission(:create, :update, :destroy) do
		(acting_user.signed_up?) and
			([:admin, :council_member].include?(acting_user.role.to_sym))
	end

	def view_permitted?(field)
		true
	end
end

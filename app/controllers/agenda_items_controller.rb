class AgendaItemsController < ApplicationController

  hobo_model_controller

  auto_actions :all

	def new
		hobo_new do
			this.agenda_id = params[:agenda_id] unless params[:agenda_id].blank?
		end
	end

	def approve
		redirect_to agenda_items_url and return if not(current_user.signed_up? and [:admin, :council_member].include?(current_user.role.to_sym))

		@agenda_item = AgendaItem.find(params[:id])
		@agenda_item.approved_by = current_user
		if (params['agenda_item']['approved'] == 'Disapprove')
			@agenda_item.approved = false
			@agenda_item.reason_of_disapproval = params[:agenda_item][:reason_of_disapproval]
		else
			@agenda_item.approved = true
			@agenda_item.reason_of_disapproval = nil
		end

		if @agenda_item.save
			flash[:notice] = 'Agenda Item updated successfully!'
			redirect_to @agenda_item and return
		else
			#raise @agenda_item.inspect
			flash[:notice] = 'Errors occured. Try later.'
			redirect_to @agenda_item and return
		end
	end

end

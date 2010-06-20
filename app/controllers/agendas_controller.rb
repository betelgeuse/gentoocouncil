class AgendasController < ApplicationController

  hobo_model_controller

  auto_actions :all

	def attend
		redirect_to agendas_url and return if not(current_user.signed_up?)

		@agenda = Agenda.find(params[:id])
		@agenda.users << current_user

		if @agenda.save
			flash[:notice] = 'You have recorded attendance successfully!'
			redirect_to @agenda and return
		else
			flash[:notice] = 'Errors occured. Try later.'
			redirect_to @agenda and return
		end
	end
end

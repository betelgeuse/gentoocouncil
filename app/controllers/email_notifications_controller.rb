class EmailNotificationsController < ApplicationController

	# cron job will run this method constantly
	def index
		Agenda.all.each do |agenda|
			Notifier.send_later(:deliver_agenda_approaching_notification, agenda)
		end
	end
end

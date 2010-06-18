class Notifier < ActionMailer::Base

  def agenda_approaching_notification(agenda)
		# you can't get app_name through Hobo methods when calling from
		# Rails controller
    @host = 'testapp.com'
    @app_name = 'Gentoo Council Web App'

    @recipients = get_recipients(agenda)
    @subject = "#{@app_name}-- Meeting Approaching"
    @from = 'AppNotifier@gmail.com'
		@sent_on = Time.now
    @body = {:agenda => agenda}
  end

protected

	# get qualified recipients for specific Agenda
	def get_recipients(agenda)
		users = User.find(:all, :conditions => ['notify_in_advance <> 0 AND notify_in_advance = ?', (agenda.start_at - Time.now).hours])
		return 'AppNotifier@gmail.com' if users.blank?

		users.collect {|u| u.email_address}
	end

end

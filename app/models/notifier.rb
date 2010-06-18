class Notifier < ActionMailer::Base

  def agenda_approaching_notification(agenda)
		configure_email(agenda)
    @subject = "#{@app_name}-- Meeting Approaching"
    @body = {:agenda => agenda}
  end

	def agenda_item_added_notification(agenda_item)
		configure_email(agenda_item.agenda)
		@subject = "#{@app_name}-- New agenda item"
		@body = {:agenda_item => agenda_item}
	end

protected

	def configure_email(agenda)
		# you can't get app_name through Hobo methods when calling from
		# Rails controller
		@host = 'testgentoo.com'
		@app_name = 'Gentoo Council Web App'
    @recipients = get_recipients(agenda)
    @from = 'AppNotifier@gmail.com'
		@sent_on = Time.now
	end

	# get qualified recipients for specific Agenda
	def get_recipients(agenda)
		users = User.find(:all, :conditions => ['notify_in_advance <> 0 AND notify_in_advance = ?', (agenda.start_at - Time.now).hours])
		return ['AppNotifier@gmail.com'] if users.blank?

		users.collect {|u| u.email_address}
	end

end

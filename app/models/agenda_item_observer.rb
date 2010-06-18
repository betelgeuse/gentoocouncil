class AgendaItemObserver < ActiveRecord::Observer
	# send notification if agenda is changed
	def after_save(agenda_item)
		Notifier.send_later(:deliver_agenda_item_added_notification, agenda_item) if agenda_item.agenda_changed?
	end
end

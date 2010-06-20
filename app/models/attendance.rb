class Attendance < ActiveRecord::Base
	belongs_to :user
	belongs_to :agenda

	validates_presence_of :user_id, :agenda_id
end

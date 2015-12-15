Iuris::Admin::AdminController.class_eval do
	before_action :set_meetings, only: :index

	private

	def set_meetings
		@meetings = Iuris::Meetings::Meeting
	end	
end
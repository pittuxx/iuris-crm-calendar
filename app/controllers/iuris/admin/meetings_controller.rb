module Iuris::Admin
	class MeetingsController < AdminController
    before_action :set_commons, only: [:index, :weekly, :monthly]

		def index
			
		end

		def weekly
      @groups = @meetings.group('meeting_date', 'starts')
      @time = Time.current
  
      respond_to do |f|
        f.js
      end
    end

    def monthly
      respond_to do |f|
        f.js
      end
    end

		private
		def set_commons
			@meetings = Iuris::Meetings::Meeting.all
      @meetings_by_day = @meetings.group_by(&:meeting_date)
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
		end
	end
end
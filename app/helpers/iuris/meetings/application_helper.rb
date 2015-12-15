module Iuris
  module Meetings
    module ApplicationHelper

    	def icon_meeting
        return '<span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>'.html_safe
      end

		  def calendar(date = Date.today, &block)
		    Calendar.new(self, date, block).table
		  end

		  class Calendar < Struct.new(:view, :date, :callback)
		    HEADER = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
		    START_DAY = :monday

		    delegate :content_tag, to: :view

		    def table
		      content_tag :table, class: "calendar" do
		        header + week_rows
		      end
		    end

		    def header
		      content_tag :tr do
		        HEADER.map { |day| content_tag :th, day }.join.html_safe
		      end
		    end

		    def week_rows
		      weeks.map do |week|
		        content_tag :tr do
		          week.map { |day| day_cell(day) }.join.html_safe
		        end
		      end.join.html_safe
		    end

		    def day_cell(day)
		      content_tag :td, view.capture(day, &callback), class: day_classes(day)
		    end

		    def day_classes(day)
		      classes = []
		      classes << "today" if day == Date.today
		      classes << "notmonth" if day.month != date.month
		      classes.empty? ? nil : classes.join(" ")
		    end

		    def weeks
		      first = date.beginning_of_month.beginning_of_week(START_DAY)
		      last = date.end_of_month.end_of_week(START_DAY)
		      (first..last).to_a.in_groups_of(7)
		    end
		  end

		  # end of calendar class

		  def format_time(time)
				time.strftime("%H:%M")
			end

			def same_hour(meeting, time)
				format_time(meeting.starts.at_beginning_of_hour) == time
			end

			def show_meeting(meeting)
				"#{format_time(meeting.starts)}\
				- #{format_time(meeting.ends)}\
				#{meeting.title} (#{meeting.user.email}" + (meeting.contact ? \
				" - #{meeting.contact.last_name})".to_str : ")")
			end

			def meeting_or_today_class(date,time)
				date_and_time = @groups.map do |meeting|
					[
						meeting.meeting_date,
						format_time(meeting.starts.beginning_of_hour),
						format_time((meeting.ends - 1).beginning_of_hour)
					]
				end
				
				date_and_time.each do |x|
					if x[0] == date && time.between?(x[1],x[2])
						return 'class=meeting'
						break
					end
				end
				return "class=today" if date == Date.today
			end
			
    end
  end
end

require_dependency "iuris/application_controller"

module Iuris::Meetings
  class MeetingsController < ApplicationController
    before_action :set_meeting, only: [:show, :edit, :update, :destroy]
    before_action :set_commons, only: [:index, :weekly, :monthly]
    authorize_resource class: Iuris::Meetings::Meeting

    # GET /meetings
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

    # GET /meetings/1
    def show
    end

    # GET /meetings/new
    def new
      @meeting = Meeting.new
    end

    # GET /meetings/1/edit
    def edit
    end

    # POST /meetings
    def create
      @meeting = Meeting.new(meeting_params)

      if @meeting.save
        redirect_to @meeting, notice: 'Meeting was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /meetings/1
    def update
      if @meeting.update(meeting_params)
        redirect_to @meeting, notice: 'Meeting was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /meetings/1
    def destroy
      @meeting.destroy
      redirect_to meetings_url, notice: 'Meeting was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_meeting
        @meeting = Meeting.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def meeting_params
        params.require(:meeting).permit(:title, :body, :starts, :ends, :meeting_date, :user_id, :contact_id)
      end

      def set_commons
        #@meetings = Meeting.all
        @meetings = current_user.meetings
        @meetings_by_day = @meetings.group_by(&:meeting_date)
        @date = params[:date] ? Date.parse(params[:date]) : Date.today
      end
  end
end

class CalendarsController < ApplicationController

  def index
    @group = Group.find(params[:group_id])

    emails = @group.users.pluck(:email)

    finder = BusyTimeFinder.new(emails)
    google_results = finder.busy_times(Time.now, Time.now + 35.days)
    @fullcalendar = GoogleBusyTimesToFullCalendarConverter.convert(google_results)
  end

  def show
  end

end

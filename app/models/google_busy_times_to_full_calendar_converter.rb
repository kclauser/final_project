class GoogleBusyTimesToFullCalendarConverter

  def self.convert(google_results)
    fullcalendar = []

    calendars = Array(google_results["calendars"])

    calendars.each do |email, details|
      busy_data = details["busy"]

      busy_data.each do |busy_hash|
        start_time = busy_hash["start"]
        end_time = busy_hash["end"]

        # TODO: Show this in the local user's prefered timezone
        fullcalendar << {
          title: email,
          start: start_time.in_time_zone("America/New_York"),
          end: end_time.in_time_zone("America/New_York")
        }
      end
    end

    return fullcalendar
  end
end

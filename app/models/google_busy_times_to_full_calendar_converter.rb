class GoogleBusyTimesToFullCalendarConverter

  def self.convert(google_results)
    fullcalendar = []

    calendars = Array(google_results["calendars"])

    calendars.each do |email, details|
      busy_data = details["busy"]

      busy_data.each do |busy_hash|
        start_time = busy_hash["start"]
        end_time = busy_hash["end"]

        fullcalendar << {
          title: email,
          start: start_time,
          end: end_time
        }
      end
    end

    return fullcalendar
  end
end

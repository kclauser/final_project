require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'google/api_client/auth/storage'
require 'google/api_client/auth/storages/file_store'

class BusyTimeFinder
  APPLICATION_NAME = 'Google Calendar API Ruby Quickstart'
  CLIENT_SECRETS_PATH = 'client_secret.json'
  CREDENTIALS_PATH = File.join(Dir.home, '.credentials', "calendar-ruby-quickstart.json")
  SCOPE = 'https://www.googleapis.com/auth/calendar.readonly'

  def initialize(emails)
    @emails = emails
  end

  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or intitiating an OAuth2 authorization request via InstalledAppFlow.
  # If authorization is required, the user's default browser will be launched
  # to approve the request.
  #
  # @return [Signet::OAuth2::Client] OAuth2 credentials
  def authorize
    FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

    file_store = Google::APIClient::FileStore.new(CREDENTIALS_PATH)
    storage = Google::APIClient::Storage.new(file_store)
    auth = storage.authorize

    if auth.nil? || (auth.expired? && auth.refresh_token.nil?)
      app_info = Google::APIClient::ClientSecrets.new( "web" => { "client_secret" => ENV["GOOGLE_CLIENT_SECRET"], "client_id" => ENV["GOOGLE_CLIENT_ID"] })
      flow = Google::APIClient::InstalledAppFlow.new({
        :client_id => app_info.client_id,
        :client_secret => app_info.client_secret,
        :scope => SCOPE})
      auth = flow.authorize(storage)
    end
    auth
  end

  # TODO: make this a method called 'busy_times' that returns the result
  #       but uses the array of email addresses we got in the constructor

  def busy_times(start_time, end_time)
    # Initialize the API
    client = Google::APIClient.new(:application_name => APPLICATION_NAME)
    client.authorization = authorize
    service = client.discovered_api('calendar', 'v3')

    raw_result = client.execute!(
      api_method: service.freebusy.query,
      headers: { 'Content-Type' => 'application/json'},
      body: JSON.dump({
                      items: @emails.map { |email| { "id" => email } },
                      timeMin: start_time.utc.iso8601,
                      timeMax: end_time.utc.iso8601,
                      # timeMin: Time.now.utc.iso8601,
                      # timeMax: 30.days.from_now.utc.iso8601,
                    })
    )

    return JSON.parse(raw_result.body)
  end

  def free_times(start_time, end_time)
    # Takes the start and end dates and figures out all the
    # available free times

    # Maybe more logic goes here, dunno yet
  end
end
#
# # example usage -- some code like this will exist
# # on the action for the page that shows the available calendar
# @group = Group.find(1)
#
# emails_from_database = @group.users.pluck(:email)
# finder = BusyTimeFinder.new(emails_from_database)
# @busy_times = finder.busy_times
# @free_times = finder.free_times
# # Mark either busy or free times on our html calendar

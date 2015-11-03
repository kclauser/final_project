require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'google/api_client/auth/storage'
require 'google/api_client/auth/storages/file_store'
require 'fileutils'
require 'active_support/all'
require 'awesome_print'

APPLICATION_NAME = 'Google Calendar API Ruby Quickstart'
CLIENT_SECRETS_PATH = 'client_secret.json'
CREDENTIALS_PATH = File.join(Dir.home, '.credentials', "calendar-ruby-quickstart.json")
SCOPE = 'https://www.googleapis.com/auth/calendar.readonly'


class BusyTimeFinder
  # Take an array of people's email addresses
  def initialize()

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
      app_info = Google::APIClient::ClientSecrets.load(CLIENT_SECRETS_PATH)
      flow = Google::APIClient::InstalledAppFlow.new({
        :client_id => app_info.client_id,
        :client_secret => app_info.client_secret,
        :scope => SCOPE})
      auth = flow.authorize(storage)
      puts "Credentials saved to #{CREDENTIALS_PATH}" unless auth.nil?
    end
    auth
  end

  # TODO: make this a method called 'busy_times' that returns the result
  #       but uses the array of email addresses we got in the constructor

  def busy_times
    # Initialize the API
    client = Google::APIClient.new(:application_name => APPLICATION_NAME)
    client.authorization = authorize
    service = client.discovered_api('calendar', 'v3')

    raw_result = client.execute!(
      api_method: service.freebusy.query,
      headers: { 'Content-Type' => 'application/json'},
      body: JSON.dump({
                      items: [
                        { "id" => "kclauser@gmail.com" },
                        { "id" => "gavin@theironyard.com" }
                      ],
                      timeMin: Time.now.utc.iso8601,
                      timeMax: 30.days.from_now.utc.iso8601,
                    })
    )

    return JSON.parse(raw_result.body)
  end
end

finder = BusyTimeFinder.new(["gavin@theironyard.com", "kclauser@gmail.com"])

times = finder.busy_times
ap times

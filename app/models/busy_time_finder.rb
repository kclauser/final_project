require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'google/api_client/auth/storage'
require 'google/api_client/auth/storages/file_store'

class BusyTimeFinder
  def initialize(emails)
    @emails = emails
  end

  def authorize
    scope = 'https://www.googleapis.com/auth/calendar.readonly'

    key = Google::APIClient::PKCS12.load_key(Base64.decode64(ENV["GOOGLE_CLIENT_PRIVATE_KEY_BASE64"]), "notasecret")
    service_account = Google::APIClient::JWTAsserter.new(ENV["GOOGLE_USER"], scope, key)

    service_account.authorize
  end

  def busy_times(start_time, end_time)
    # Initialize the API
    client = Google::APIClient.new(application_name: "GameNightHeroku")
    client.authorization = authorize
    service = client.discovered_api('calendar', 'v3')

    raw_result = client.execute!(
      api_method: service.freebusy.query,
      headers: { 'Content-Type' => 'application/json'},
      body: JSON.dump({
                      items: @emails.map { |email| { "id" => email } },
                      timeMin: start_time.utc.iso8601,
                      timeMax: end_time.utc.iso8601,
                    })
    )

    return JSON.parse(raw_result.body)
  end
end

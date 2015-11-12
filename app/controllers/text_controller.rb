class TextController < ApplicationController

  def create
    # number_to_send_to = params[:number_to_send_to]
    number_to_send_to = "8138177340"
    twilio_phone_number = "8139023111"

    @twilio_client = Twilio::REST::Client.new ENV["TWILIO_CLIENT_ID"], ENV["TWILIO_CLIENT_SECRET"]

    @twilio_client.account.sms.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number_to_send_to,
      :body => "You have a new event scheduled on #{number_to_send_to}"
    )
  end
end

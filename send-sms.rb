require 'rubygems'
require 'twilio-ruby'
require 'takeaway'

module TwilioClient

  def send_sms(to, message)

    account_sid = "AC3da3c8da45d0b5b07610c3525228a401"
    auth_token = "678a25b66688cc587851edca2eab15b4"
    client = Twilio::REST::Client.new account_sid, auth_token
   
    from = "+441706300094" # Your Twilio number
   

    client.account.messages.create(
      :from => from,
      :to => to,
      :body => message
    ) 
  end
end
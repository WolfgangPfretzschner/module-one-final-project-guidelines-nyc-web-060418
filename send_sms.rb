# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

account_sid = 'ACb5394587dfg987345987dfg923558'
auth_token = '63123342fd3232e362342561a39a3aaeab4'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+17205133098' # Your Twilio number
to = '+12396915600' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)

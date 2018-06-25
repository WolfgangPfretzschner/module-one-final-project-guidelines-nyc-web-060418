require_relative '../config/environment'


# Team.create_team_data

# Event.create_events_data

welcome
loop do
  country_list

  answer = input
  if answer == 'exit'
    exit_message
    break
  else
    getting_country_from_user(answer)

    call_stats

    call_events
  end
end

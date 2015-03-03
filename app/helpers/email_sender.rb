module EmailSender

  def send_simple_message(email_address, token)
    RestClient.post "https://api:key-39ca26665a5bee2b0e488227de98810b"\
    "@api.mailgun.net/v2/sandbox3dbfdb530019489dac77b5358d71ce61.mailgun.org/messages",
    :from => "Mailgun Sandbox <postmaster@sandbox3dbfdb530019489dac77b5358d71ce61.mailgun.org>",
    :to => "#{email_address}",
    :subject => "Reset Chitter Password",
    :text => "Since you've forgotten your password like a prize idiot, you can reset it by accessing this link:\n localhost:9292/users/reset_password/#{token} \n\nIt'll expire in an hour though, so get to it!"
  end

end
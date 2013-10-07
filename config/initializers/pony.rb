Pony.options = {
  :from => ENV['GMAIL_USER'],
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => ENV['GMAIL_USER'],
    :password             => ENV['GMAIL_PASSWORD'],
    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain               => "etsyradar.herokuapp.com" # the HELO domain provided by the client to the server
  }
}

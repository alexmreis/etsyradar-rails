class Alert < ActiveRecord::Base
  belongs_to :radar
  belongs_to :user

  after_create :send_message

  def send_message
    Pony.mail(:to => user.email, :subject => subject, :body => message)
  end
end

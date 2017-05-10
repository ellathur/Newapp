class UserMailer < ApplicationMailer
  default from: "aguzey2@yahoo.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'aguzey2@yahoo.com',
        :subject => "A new contact form message from #{name}")
  end
end

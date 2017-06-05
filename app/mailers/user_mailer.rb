class UserMailer < ApplicationMailer
  default from: "aguzey2@yahoo.com"

  def contact_form(email, name, message)
    @email = email
    @name = name
    @message = message
      mail(:from => email,
        :to => 'aguzey2@yahoo.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    	@user = user
    	@appname = "Cafe Nala"
    	mail(to: user.email, subject: "Welcome to #{@appname}!")
  end

  def thank_you
	  @name = params[:name]
	  @email = params[:email]
	  @message = params[:message]
	  UserMailer.contact_form(@email, @name, @message).deliver_now
	end


end

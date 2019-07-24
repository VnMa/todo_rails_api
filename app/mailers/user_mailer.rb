class UserMailer < ApplicationMailer
  # default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://example.com'
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    mail(to: email_with_name, subject: 'Welcome to My Awesome Site')
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @greeting = "Hi #{user.name}"
    activation_token = params[:activation_token]
    @activation_url = "http://localhost:3000/account_activations/#{activation_token}/edit?email=#{user.email}"
    mail to: "#{user.email}"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subjectp
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

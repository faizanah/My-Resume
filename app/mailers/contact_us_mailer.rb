class ContactUsMailer < ApplicationMailer

  def send_email(contact)
    # ActionMailer::Base.smtp_settings = {
    #     :address              => "smtp.gmail.com",
    #     :port                 => 587,
    #     :user_name            => ENV['gmail_username'],
    #     :password             => ENV['gmail_password'],
    #     :authentication       => "plain",
    #     :enable_starttls_auto => true
    # }
    @contact = contact
    @user = contact.admin_user
    mail( to: @user.profile.email, subject: @contact.subject , from:  @contact.email)
  end

end

class ContactUsMailer < ApplicationMailer

  def send_email(contact)
    @contact = contact
    @user = contact.admin_user
    mail( to: @user.profile.email, subject: @contact.subject , from:  @contact.email)
  end

end

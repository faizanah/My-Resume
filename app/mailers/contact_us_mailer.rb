class ContactUsMailer < ApplicationMailer

  def send_email(contact)
    @contact = contact
    @user = contact.admin_user
    mail( to: @user.profile.email, subject: @contact.subject , from:  @user.profile.email)
  end

  def thank_you_for_contact_us contact
    @contact = contact
    @user = contact.admin_user
    mail( to: @contact.email, subject: "Thank You!" , from:  @user.profile.email)
  end

end

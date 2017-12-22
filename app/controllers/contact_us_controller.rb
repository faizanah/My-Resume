class ContactUsController < ApplicationController

  def create
    @contact = current_user.contacts.new(name: params[:name] , email: params[:email] , message: params[:message] , subject: params[:subject])
    respond_to do |format|
      if @contact.save
        format.json do
          render json: {
              success: true,
              message: 'Thank you for your message. We will contact you soon!'
          }.to_json ,  status: :created
        end
      else
        format.json do
          render json: {
              success: false,
              errors: @contact.errors.full_messages
          }.to_json ,  status: :unprocessable_entity
        end
      end
    end
  end
end

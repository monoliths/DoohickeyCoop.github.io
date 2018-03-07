class MailsController < ApplicationController
  def subscribe
    email = params[:email]
    # gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API'])
    flash[:success] = "Email signed up!"
    redirect_to root_path
  end
end
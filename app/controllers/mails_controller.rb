class MailsController < ApplicationController
  def subscribe
    email = params[:email]
    flash[:success] = "Email signed up!"
    redirect_to root_path
  end
end
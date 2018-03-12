class MailsController < ApplicationController
  def subscribe
    email = params[:email]
    first_name = params[:first_name]
    last_name = params[:last_name]
    if valid_subscription?(email, first_name, last_name)
      request_subscription(email, first_name, last_name)
      flash[:success] = 'Email signed up!'
    else
      flash[:danger] = 'fail'
    end
    redirect_to root_path
  end

  private
  def request_subscription(email, first_name, last_name)
    #gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    #md5 = Digest::MD5.new
    #md5.update(user.email)
    #gibbon.lists(ENV['MAILING_LIST_ID']).members(md5.hexdigest).upsert(body: {email_address: email, status: "subscribed"})
  end

  def valid_subscription?(email, first_name, last_name)
    true
  end
end
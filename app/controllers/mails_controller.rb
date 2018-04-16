class MailsController < ApplicationController
  def subscribe
    email = params[:email]
    first_name = params[:first_name]
    last_name = params[:last_name]
    if valid_subscription_reqs?(email, first_name, last_name)
      request_subscription(email, first_name, last_name)
    else
      flash[:danger] = 'Something went wrong.'
    end
    redirect_to root_path
  end

  private
  def request_subscription(email, first_name, last_name)
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    md5 = Digest::MD5.new
    md5.update(email)
    gibbon.lists(ENV['MAILING_LIST_ID']).members(md5.hexdigest).upsert(body:
    { email_address: email,
      status: 'subscribed',
      merge_fields: { FNAME: first_name, LNAME: last_name } })
    flash[:success] = "#{email} has been subscribed to the mailing list."
  rescue Gibbon::MailChimpError
    flash[:danger] = "An error occured, please check your email.
      If this continues please contact the admin at woodsan@doohickeycoop.com"
  end

  def valid_subscription_reqs?(email, first_name, last_name)
    if email.empty? || first_name.empty? || last_name.empty?
      flash[:danger] = 'Incompleted fields were submitted'
      return false
    end
    true
  end
end
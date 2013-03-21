class ContactFormsController < ApplicationController
  def post_response(data, type, http_status)
    render type => data, :status => http_status
  end
  def register
    if Customer.exists?(:email => params[:email])
      data = Customer.find_by_email(params[:email])
      type = :json
      status = 200
    elsif Customer.exists?(:uuid => params[:uuid])
      data = Customer.find_by_uuid(params[:uuid])
      type = :json
      status = 200
    else
      if /^.+@.+\..+$/ === params[:email]
        customer = Customer.new
        customer.email = params[:email]
        customer.uuid = UUID.new.generate
        if customer.save
          data = customer.to_json
          type = :json
          status = 200
        else 
          data = "error while saving"
          type = :text
          status = 500
        end
      else
        data = "wrong email format"
        type = :text
        status = 500
      end
    end
    post_response(data,type,status)
  end
  def send_mail
    if Customer.exists?(:uuid => params[:uuid])
      customer = Customer.find_by_uuid(params[:uuid])
      input = params[:contact_form]
      if !input.nil?
        input.delete_if {|form_field, value| value.blank?}
      end
      if !input.blank?
        if ContactForward.send_mail(customer,input).deliver
          feedback = "sent"
          status = 200
        else
          feedback = "error"
          status = 200
        end
      else
        feedback = "empty"
        status = 200
      end
    else
      feedback = "notfound"
      status = 200
    end
    post_response(feedback, :text, status)
  end
end

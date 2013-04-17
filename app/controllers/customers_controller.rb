class CustomersController < ApplicationController
  include FormService::Responder
  def new
    if Customer.exists?(:email => params[:email]) || Customer.exists?(:uuid => params[:uuid])
      response = {
        :data => "409 Conflict",
        :type => :text,
        :status => 409
      }
    else
      if /^.+@.+\..+$/ === params[:email] && params[:service_key] == ENV["SERVICE_KEY"]
        customer = Customer.new
        customer.email = params[:email]
        customer.uuid = UUID.new.generate
        if customer.save
          response = {
            :data => customer.to_json,
            :type => :json,
            :status => 201
          }
        else
          response = {
            :data => "500 Internal Server Error - Error while saving",
            :type => :text,
            :status => 500
          }
        end
      else
        response = {
          :data => "403 Forbidden",
          :type => :text,
          :status => 403
        }
      end
    end
    post_response(response)
  end
  def show
    if params[:service_key] == ENV["SERVICE_KEY"]
      if Customer.exists?(:email => params[:email]) || Customer.exists?(:uuid => params[:uuid])
        customer = Customer.find_by_email(params[:email]) || Customer.find_by_uuid(params[:uuid])
        response = {
          :data => customer.to_json,
          :type => :json,
          :status => 200
        }
      else
        response = {
          :data => "410 Gone - Customer not existing",
          :type => :text,
          :status => 410
        }
      end
    else
      response = {
        :data => "403 Forbidden",
        :type => :text,
        :status => 403
      }
    end
    post_response(response)
  end
end
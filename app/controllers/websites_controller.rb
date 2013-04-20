class WebsitesController < ApplicationController
  before_filter :authenticate
  def new
    if Customer.exists?(params[:customer_id])
      customer = Customer.find(params[:customer_id])
      website = Website.new
      website.uri = params[:uri]
      website.customer = customer
      if website.save
        customer_attributes = customer.attributes
        customer_attributes['new_website'] = website.attributes
        response = {
          :data => customer_attributes.to_json,
          :type => :json,
          :status => 201
        }
      else
        response = {
          :data => website.errors.full_messages,
          :type => :text,
          :status => 500
        }
      end
    else
      response = {
        :data => "410 Gone - Customer not existing",
        :type => :text,
        :status => 410
      }
    end
    render Service::Responder.response(response)
  end
end

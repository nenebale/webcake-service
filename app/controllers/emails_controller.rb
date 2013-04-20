class EmailsController < ApplicationController
  def new
    if Customer.exists?(:uuid => params[:uuid])
      customer = Customer.find_by_uuid(params[:uuid])
      input = params[:contact_form]
      if input.nil?
        input.delete_if {|form_field, value| value.blank?}
      end
      if !input.blank?
        if ContactForm.form_input(customer,input).deliver
          response = {
            :data => "200 OK - Mail sent",
            :type => :text,
            :status => 200
          }
        else
          response = {
            :data => "500 Internal Server Error - Mail not sent",
            :type => :text,
            :status => 500
          }
        end
      else
        response = {
          :data => "500 Internal Server Error - No Input",
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

class ApplicationController < ActionController::Base
  protect_from_forgery
  def authenticate
    if !Service::ServiceKey.is_service?(params[:service_key])
      render Service::Responder.response({
        :type => :text,
        :data => "401 Unauthorized",
        :status => 401
      })
    end
  end
end

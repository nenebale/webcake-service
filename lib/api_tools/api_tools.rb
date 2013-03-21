module ApiTools
  module Responder
    def post_response(data,http_status)
      render :text => data, :status => http_status
    end
  end
end
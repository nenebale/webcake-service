module Service::Responder
  def self.response(response = {:type => :text, :data => '', :status => '200'})
    return response[:type] => response[:data], :status => response[:status]
  end
end

module FormService::Responder
  def post_response(response = {:type => :text, :data => '', :status => '200'})
    render response[:type] => response[:data], :status => response[:status]
  end
end

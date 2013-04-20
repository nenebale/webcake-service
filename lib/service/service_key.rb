module Service::ServiceKey
  def self.is_service?(service_key = '')
    if service_key == ENV['SERVICE_KEY'] && Rails.env.production?
      return true
    elsif Rails.env.development? || Rails.env.test?
      return true
    else
      return false
    end
  end
end
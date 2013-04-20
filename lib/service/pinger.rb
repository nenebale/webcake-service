module Service::Pinger
  require 'httparty'
  include HTTParty
  def self.call(uri)
    start = Time.now
    timeout = 60
    response = HTTParty.get(uri, :timeout => timeout)
    duration = Time.now - start
    start = nil
    return "#{uri}: HTTP #{response.code}, #{duration}s"
  end
end
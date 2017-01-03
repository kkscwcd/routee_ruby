
module RestClientExt

  def self.delete(url, payload, headers={}, &block)
    RestClient::Request.execute(:method => :delete, :url => url, :payload => payload, :headers => headers, &block)
  end

end
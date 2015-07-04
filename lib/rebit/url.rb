module Rebit
  class Url

    def self.for(resource, opts={})
      uri = URI.parse(HOST)
      uri.path = "/api/#{API_VERSION}/#{resource}"
      uri.query = opts.to_query if opts.any?
      uri.to_s
    end

  end
end

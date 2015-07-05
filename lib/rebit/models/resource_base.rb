module Rebit
  class ResourceBase

    class_attribute :site
    self.site = HOST

    class_attribute :prefix
    self.prefix = "/api/#{API_VERSION}"

    include Virtus.model
    attribute :id, Integer

    def persisted?
      id.present?
    end

    def self.collection_url(tokens={})
      uri = URI.parse(site)
      if self.prefix.present?
        uri.path = "#{PathParser.parse(self.prefix, tokens)}/#{collection_name}"
      end
      uri.to_s
    end

    def self.resource_name
      self.name.demodulize.underscore
    end

    def self.collection_name
      resource_name.pluralize
    end

  end
end

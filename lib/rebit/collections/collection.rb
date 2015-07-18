module Rebit
  class Collection

    class_attribute :site
    class_attribute :prefix
    class_attribute :element_name, instance_accessor: false

    include Virtus.model
    attribute :element_name, String, default: :default_element_name, lazy: true
    attribute(:collection_name, String, {
      default: :default_collection_name,
      lazy: true,
    })

    def collection_url(params={})
      uri = URI.parse(site)
      uri.path = "#{PathParser.parse(prefix, params)}/#{collection_name}"
      uri.to_s
    end

    def element_url(id, params={})
      "#{collection_url(params)}/#{id}"
    end

    def find(id, params={})
      attributes = element_response_body(id, params)
      element_class.new(attributes)
    end

    def element_response_body(id, params={})
      response = Typhoeus.get(element_url(id, params))
      JSON.parse(response.body).with_indifferent_access
    end

    private

    def element_class
      full_element_constant_name.constantize
    end

    def full_element_constant_name
      self.class.to_s.gsub("Collection", "")
    end

    def element_class_name
      full_element_constant_name.demodulize
    end

    def default_element_name
      self.class.element_name || element_class_name.underscore
    end

    def default_collection_name
      element_name.pluralize
    end

  end
end

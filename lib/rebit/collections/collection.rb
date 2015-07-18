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
      prefix_options = default_prefix_options.merge(params)
      uri.path = "#{PathParser.parse(prefix, prefix_options)}/#{collection_name}"
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

    def default_prefix_options
      {}
    end

    def default_all_params
      attributes
    end

    def default_create_params(attrs={})
      attributes.merge(attrs)
    end

    def element_initialization_attributes(attrs={})
      default_element_attributes.merge(attributes).merge(attrs)
    end

    def default_element_attributes
      {}
    end

    def initialize_element(attrs={})
      if attrs.nil?
        raise ArgumentError, "can't pass nil arguments when initializing an element"
      end
      element_class.new(element_initialization_attributes(attrs))
    end

    def all
      response = Typhoeus.get(collection_url, body: default_all_params)
      element_hashes = JSON.parse(response.body).map(&:with_indifferent_access)
      unless response.success?
        fail StandardError, json[:errors].join(", ")
      end
      element_hashes.map { |hash| initialize_element(hash) }
    end

    def create(attrs={})
      response = Typhoeus.post(collection_url, {
        body: default_create_params(attrs),
      })
      unless response.success?
        binding.pry
        puts response.body
        return false
      end
      json = JSON.parse(response.body).with_indifferent_access
      initialize_element(json[element_name])
    end

    def create!(attrs={})
      record = self.create(attrs)
      record ? record : fail("Unable to create #{element_name}")
    end

    def find(id)
      response = Typhoeus.get(element_url(id))
      return false unless response.success?
      json = JSON.parse(response.body).with_indifferent_access
      initialize_element(json[element_name])
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

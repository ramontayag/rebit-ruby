module Rebit
  class VendorBase < ResourceBase

    self.prefix = ResourceBase.prefix + "vendors/:vendor_api_token/"

    def prefix_options
      self.class.default_prefix_options
    end

    class << self
      def default_prefix_options
        { vendor_api_token: Rebit.vendor_api_token }
      end

      def element_path_with_default_prefix_options(
        id,
        prefix_options = {},
        query_options = nil
      )
        prefix_options.merge!(self.default_prefix_options)
        element_path_without_default_prefix_options(id, prefix_options, query_options)
      end
      alias_method_chain :element_path, :default_prefix_options

      def collection_path_with_default_prefix_options(
        prefix_options = {},
        query_options = nil
      )
        prefix_options.merge!(self.default_prefix_options)
        collection_path_without_default_prefix_options(prefix_options, query_options)
      end
      alias_method_chain :collection_path, :default_prefix_options
    end

  end
end

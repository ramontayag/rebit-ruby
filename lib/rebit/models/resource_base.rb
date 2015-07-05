module Rebit
  class ResourceBase

    include Virtus.model
    attribute :id, Integer

    def persisted?
      id.present?
    end

  end
end

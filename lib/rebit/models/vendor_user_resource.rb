module Rebit
  class VendorUserResource < VendorBase

    attribute :user_id, Integer
    self.prefix = VendorBase.prefix + "/users/:user_id"

  end
end

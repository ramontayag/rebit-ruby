module Rebit
  class Client

    def rates
      response = HTTPI.get(Url.for(:rates))
      JSON.parse(response.body)
    end

  end
end

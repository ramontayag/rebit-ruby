module Rebit
  class PathParser

    def self.parse(path, tokens)
      parsed_path = path.dup
      tokens.each { |key, value| parsed_path.gsub!(":#{key}", value.to_s) }
      parsed_path
    end

  end
end

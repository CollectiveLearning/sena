module Wrapper
  class Base

    HOST = 'http://localhost:3000'

    def initialize(options = {})
      options.each do |key, val|
        self.send("#{key}=", val)
      end
    end

    def self.get(url)
      HTTParty.get(HOST + url).parsed_response
    end

  end
end

module Wrapper
  class Base

    HOST = 'https://api-sena.herokuapp.com/'

    def initialize(options = {})
      options.each do |key, val|
        self.send("#{key}=", val)
      end
    end

    # Instance Methods
    def delete
      HTTParty.delete(HOST + "/#{self.class.pluralized_resource}/#{self.id}.json")
    end

    def save
      HTTParty.post(HOST + "/#{self.class.pluralized_resource}.json", body: to_json,
                    headers: {'Content-Type' => 'application/json'})
    end

    # Class Methods
    def self.pluralized_resource
      to_s.downcase.pluralize
    end

    def self.all
      get("#{pluralized_resource}.json").map do |item|
        new(item)
      end
    end

    def self.find(id)
      new(get("/#{pluralized_resource}/#{id}.json"))
    end

    def self.get(url)
      HTTParty.get(HOST + url).parsed_response
    end

  end
end

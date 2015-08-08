module Wrapper
  class Base

    # URL base of the API
    HOST = 'https://api-sena.herokuapp.com/'

    def initialize(options = {})
      options.each do |key, val|
        self.send("#{key}=", val)
      end
    end

    # Instance Methods

    # Delete a record in the API by its ID
    def delete
      self.class.delete("/#{self.class.pluralized_resource}/#{self.id}.json")
    end

    # Create a record in the API
    def save
      self.class.post("/#{self.class.pluralized_resource}.json", to_json)
    end

    # Class Methods

    # Pluralize the name of the class, it is would be overwrite if needed
    # Example
    # User.pluralized_resource
    # => users
    # Return => String
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

    # Perform an HTTP request via GET
    def self.get(url)
      HTTParty.get(HOST + url).parsed_response
    end

    # Perform an HTTP request via PUT
    def self.put(url)
      HTTParty.put(HOST + url).parsed_response
    end

    # Perform an HTTP request via POST
    def self.post(url, body)
      headers = {'Content-Type' => 'application/json'}
      HTTParty.post(HOST + url, body: body, headers: headers).parsed_response
    end

    # Perform an HTTP request via DELETE
    def self.delete(url)
      HTTParty.delete(HOST + url).parsed_response
    end
  end
end

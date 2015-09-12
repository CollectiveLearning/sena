module Decorator
  class Base

    def initialize(object)
      @object = object
      create_method
    end

    def object
      @object
    end

    def self.decorate_collection(collection)
      collection.map { |object| new(object) }
    end

    def self.decorate(object)
      new(object)
    end

    private

    def create_method
      self.class.send(:alias_method, self.class.to_s.gsub('Decorator', '').downcase, :object)
    end

    def method_missing(method, *args, &block)
      if object.respond_to?(method)
        object.send(method, *args, &block)
      else
        super
      end
    end

  end
end

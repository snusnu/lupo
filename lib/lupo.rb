# encoding: utf-8

# Includes Enumerable and provides #each
class Lupo < Module
  # Initialize a new instance
  #
  # @example
  #
  #   require 'lupo'
  #
  #   class Collection
  #     include Lupo.new(:entries)
  #
  #     def initialize(entries)
  #       @entries = entries
  #     end
  #   end
  #
  #   Collection.new([1,2,3]).each do |entry|
  #     puts(entry)
  #   end
  #
  # @param [#to_s] name
  #   the name of the enumerable
  #
  # @return [undefined]
  #
  # @api public
  def initialize(name)
    @name = :"@#{name}"
  end

  private

  # Define the #each method on the host
  #
  # @param [Object] host
  #   the hosting object
  #
  # @return [undefined]
  #
  # @api private
  def included(host)
    enumerable = @name
    host.class_eval do
      include Enumerable
      define_method :each do |&block|
        return to_enum unless block
        instance_variable_get(enumerable).each(&block)
        self
      end
    end
  end
end # Lupo

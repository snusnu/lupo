# encoding: utf-8

require 'concord'

# Includes Enumerable and provides #each.
# Optionally includes Concord to provide
# #initialize and Equalizer for equality
# methods
#
# Remember that Enumerable#entries is part
# of ruby, so avoiding "entries" as the
# internal enumerable's name is a good idea
# if your enumerable is no array instance.
class Lupo < Module
  private_class_method :new

  # Build a module providing #each and Enumerable
  #
  # @example
  #
  #   class Collection
  #     include Lupo.enumerable(:items)
  #
  #     def initialize(items)
  #       @items = items
  #     end
  #   end
  #
  #   collection = Collection.new([1,2,3])
  #
  #   collection.each { |i| puts(i) } # => collection
  #   collection.each.to_a            # => [1,2,3]
  #   collection.is_a?(Enumerable)    # => true
  #
  # @param [#to_s] name
  #   the name of the enumerable
  #
  # @return [undefined]
  #
  # @api public
  def self.enumerable(name)
    new(name, [Enumerable])
  end

  # Build a module providing #each, Enumerable and Concord
  #
  # @example
  #
  #   class Collection
  #     include Lupo.collection(:items)
  #   end
  #
  #   collection = Collection.new([1,2,3])
  #
  #   collection.each { |i| puts(i) } # => collection
  #   collection.each.to_a            # => [1,2,3]
  #   collection.is_a?(Enumerable)    # => true
  #
  #   other = Collection.new([1,2,3])
  #
  #   # see equalizer for detailed docs
  #   collection.equal?(other) # => false
  #   collection.eql?(other)   # => true
  #   collection == other      # => true
  #
  # @param [#to_s] name
  #   the name of the enumerable
  #
  # @return [undefined]
  #
  # @api public
  def self.collection(name)
    new(name, [Enumerable, Concord.new(name)])
  end

  # Initialize a new instance
  #
  # @param [#to_s] name
  #   the name of the enumerable
  #
  # @param [#each] modules
  #   the modules to include into a host
  #
  # @return [undefined]
  #
  # @api private
  def initialize(name, modules)
    @modules, @body = modules, lambda { |&block|
      return to_enum unless block
      instance_variable_get(:"@#{name}").each(&block)
      self
    }
  end

  private

  # Define the #each method on the host and include modules
  #
  # @param [Object] host
  #   the hosting object
  #
  # @return [undefined]
  #
  # @api private
  def included(host)
    host.instance_exec(@modules, @body) do |modules, body|
      include(*modules)
      define_method(:each, &body)
    end
  end
end # Lupo

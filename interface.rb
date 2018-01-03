# Provides simple interface like behaviour
# for ruby classes and modules
module Interface
  @@all_interfaces = []

  def implements(const)
    raise_invalid_interface(const) unless @@all_interfaces.include?(const)

    yield self

    enforce_methods_implemented(implementor: self, interface: const)
  end

  def interface(bool)
    @@all_interfaces << self if bool == :true
  end

  private

  def enforce_methods_implemented(implementor:, interface:)
    interface_methods = get_all_methods_for(interface)
    implementor_methods = get_all_methods_for(implementor)

    missing_methods = filter_interface_methods(
      implementor_methods,
      interface_methods
    )

    unless missing_methods.empty?
      raise_not_implemented_error(implementor, interface, missing_methods)
    end
  end

  def raise_invalid_interface(const)
    raise ArgumentError, "#{const.class} #{const}" \
      " is not an interface. " \
      "You can implement interface like behaviour by adding 'interface :true'" \
      " to your class or module."
  end

  def raise_not_implemented_error(implementor, interface, missing_methods)
    raise NotImplementedError, "Methods: #{missing_methods} " \
      "from #{interface.class.to_s.downcase} #{interface} " \
      "not implemented in " \
      "#{implementor.class.to_s.downcase} #{implementor}."
  end

  def get_all_methods_for(mod)
    get_and_format_singleton_methods_for(mod) +
      get_and_format_instance_methods_for(mod)
  end

  def get_and_format_singleton_methods_for(mod)
    methods_array = mod.methods(false)
    format_method_names('::', methods_array)
  end

  def get_and_format_instance_methods_for(mod)
    methods_array = mod.instance_methods(false)
    format_method_names('#', methods_array)
  end

  def format_method_names(prepend_string, methods_array)
    methods_array.map! do |method|
      "#{prepend_string}#{method}"
    end
  end

  def filter_interface_methods(implementor_methods, interface_methods)
    interface_methods.reject do |method|
      implementor_methods.include?(method)
    end
  end
end

# include in Class
class Class
  include Interface
end

# include in Module
class Module
  include Interface
end

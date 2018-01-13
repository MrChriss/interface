# interface
# Simple interface implementation for ruby.
# Usage:
```ruby
  require 'your_path/interface'

  class Klass
    interface!

    def self.a_class_method; end

    def some_method; end
    def other_method; end
  end

  class OtherKlass
    implements Klass

    def some_method; end
  end

 # => will raise: Methods: ["::a_class_method", "#other_method"] from class Klass not implemented in class OtherKlass. (NotImplementedError)
```
# Can be used in the same manner with modules.

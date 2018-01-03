# interface
# Simple interface implementation for ruby.
# Usage:
```ruby
  class Animal
    interface :true

    def breathe
    end
  end

  class Dog
    implements Animal do
      def breathe
      end
    end
  end
```
# Can be used in the same manner with modules.

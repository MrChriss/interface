# interface.rb
## A simple interface like implementation for ruby.
## Usage:
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
It can be used in the same manner with modules.

### License
MIT License

Copyright (c) 2018, Krištof B. Črnivec

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

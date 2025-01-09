## Notes for learn ruby language 

## Resources
- basics from [GoRails](https://gorails.com/episodes/strings-in-ruby?autoplay=1) series 
- [ruby's docs](https://docs.ruby-lang.org/en/master/)


### General infos

- type **irb** in terminal and it opens a REPL session

- Symbols are immutable and stored only once in memory, making them efficient for comparisons and as hash keys.

- difference between `puts 2+2` and `print 2+2` is both display 4 as output but puts adds newline and print doesn't, 
- **p** prints the object with more detail representation of that object

- object **.class** is returning the class type of that object 

- any method that ends with **?** return boolean

- only false and nil are considered false and any other thing is true

- constant variable should start with capital letter, and then it's optional to choose whether it capital or small case  

- constants can be changed and resign, but it will return warning 

### Strings

- **string interpolation** is be done via `#{}` for example `"score is #{4+2}"` the output is `score is 6`

- **sub** method takes 2 argument, first is the string need to change and second is the replacement of that string but only change the first occurrence 

- **gsub** the same as **sub** but change any occurrence of the replacement

- the replacement can be a regular expression 

- **include?** checks if the string has a specific part and return whether true or false  

```rb

    #string[index]
    'bar'[0]      # => "b"
    'bar'[2]      # => "r"

    #string[start, length]
    'foo'[0, 2]      # => "fo"
    'тест'[1, 2]     # => "ес"

    #string[range]
    'foo'[0..1]     # => "fo"
    'foo'[0, 2]     # => "fo"

    #string[regexp, capture = 0]
    'foo'[/o/]                # => "o"
    'foo'[/x/]                # => nil

    #string[substring]
    'foo'['oo'] # => "oo"
    'foo'['xx'] # => nil

```

- **=~** : Returns the index of the first substring that matches a given Regexp or other object; returns nil if no match is found.

- **match**: Returns a MatchData object if the string matches a given Regexp; nil otherwise.

- **match?**: Returns true if the string matches a given Regexp; false otherwise.

- **start_with?**: Returns true if the string begins with any of the given substrings.

- **end_with?**: Returns true if the string ends with any of the given substrings.

- **eql?**: Returns true if the content is the same as the given other string.

- can make instance methods on strings as `"hello world".upcase` this code will result `"HELLO WORLD"`

- in strings **count** is a method takes a letter and return its occurrence 


### Integers

- **<=>**: Returns a number indicating whether self is less than, equal to, or greater than the given value.

- **ceil**: Returns the smallest number greater than or equal to self.

- **digits**: Returns an array of integers representing the base-radix digits of self.

- **floor**: Returns the greatest number smaller than or equal to self.

- **pow**: Returns the modular exponentiation of self.

- **pred**: Returns the integer predecessor of self.

- **remainder**: Returns the remainder after dividing self by the given value.

- **round**: Returns self rounded to the nearest value with the given precision.

- **succ** (aliased as next): Returns the integer successor of self.

- **to_f**: Returns self converted to a Float.

- **to_s** (aliased as inspect): Returns a string containing the place-value representation of self in the given radix.

- **to_i**: Returns self converted to a Integer.

```rb
    Integer.sqrt(24)      # => 4

    1 <=> 2              # => -1
    1 <=> 1              # => 0
    1 <=> 0              # => 1
    1 <=> 'foo'          # => nil

    36.gcd(60)                  #=> 12
    2.gcd(2)                    #=> 2
```


## Arrays

- **first**: Returns one or more leading elements.

- **last**: Returns one or more trailing elements.

- **max**: Returns one or more maximum-valued elements, as determined by <=> or a given block.

- **min**: Returns one or more minimum-valued elements, as determined by <=> or a given block.

- **sort**: Returns all elements in an order determined by <=> or a given block.

- **take**: Returns leading elements as determined by a given index.

- **take_while**: Returns leading elements as determined by a given block.

- **uniq**: Returns an array containing non-duplicate elements.

- **values_at**: Returns the elements at given offsets.

- **<<:** Appends an element.

- **insert**: Inserts given objects at a given offset; does not replace elements.

- **push**: Appends elements.

- **unshift**: Prepends leading elements.

- **delete**: Removes elements equal to a given object.

- **delete_at**: Removes the element at a given offset.

- **delete_if**: Removes elements specified by a given block.

- **keep_if**: Removes elements not specified by a given block.

- **pop**: Removes and returns the last element.

- **join**: Returns a newsString containing the elements joined by the field separator.

- **to_a**: Returns self or a new array containing all elements.

- **sum**: Returns a sum of elements according to either + or a given block.


### Hashes
- ```rb
    # The older syntax for Hash data uses the “hash rocket,” =>:
    h = {:foo => 0, :bar => 1, :baz => 2}
    h # => {:foo=>0, :bar=>1, :baz=>2}
    
    # you can use a newer JSON-style syntax,
    h = {foo: 0, bar: 1, baz: 2}
    h # => {:foo=>0, :bar=>1, :baz=>2}
    
    # retrieve value
    h = {foo: 0, bar: 1, baz: 2}
    h[:foo] # => 0
  ```
### Methods and Functions

- Methods in Ruby implicitly return the value of the last executed statement.

- You can also use the return keyword to explicitly return a value.

- Default Parameters:
    ```rb
    def greet(name = "Guest")
      puts "Hello, #{name}!"
    end
    greet # Output: Hello, Guest!
    greet("Bob") # Output: Hello, Bob!
    ```

- Variable-Length Arguments:
    ```rb
    def sum(*numbers)
      numbers.sum
    end
    sum(1, 2, 3) # Output: 6
    ```

- Method Naming Conventions: Method names should be lowercase and use underscores for multi-word names (snake_case).
  `calculate_total, find_user_by_id.`

- predicate Methods: Methods that return a boolean value typically end with a ?.
    
    ``` rb 
    def even?(number)
      number % 2 == 0
    end
    even?(4) # Output: true
    ```
- Bang Methods: Methods that modify the object they are called on often end with a **!**.

  ```rb
   def capitalize_name!(name)
      name.capitalize!
   end
   capitalize_name!("alice")
  ```

### Loops and Blocks

- upto and downto methods
  ```rb
  start_number = 1
  end_number = 10
  start_number.upto(end_number) do |i|
      # Code to execute for each iteration
  end
  
  
  end_number.downto(start_number) do |i|
    # Code to execute for each iteration
  end
  ```

- Use the Proc class constructor:
  ```rb 
    proc1 = Proc.new {|x| x**2 }
  ```


- Use the Kernel#proc method as a shorthand of Proc.new:

  ```rb
      proc2 = proc {|x| x**2 }
  ```
- Receiving a block of code into proc argument (note the &):

  ```rb
      def make_proc(&block)
        block
      end
      proc3 = make_proc {|x| x**2 }
  ```
  

- **Lambda**: Equivalent to Proc.new, except the resulting Proc objects check the number of parameters passed when called.



- **Lambda** **VS** non-lambda semantics aka **Proc**:
  - Procs are coming in two flavors: lambda and non-lambda (regular procs). Differences are:
  - In lambdas, return and break means exit from this lambda;
  - In non-lambda procs, return means exit from embracing method (and will throw LocalJumpError if invoked outside the method);
  - In non-lambda procs, break means exit from the method which the block given for. (and will throw LocalJumpError if invoked after the method returns);
  - In lambdas, arguments are treated in the same way as in methods: strict, with ArgumentError for mismatching argument number, and no additional argument processing;
  - Regular procs accept arguments more generously: missing arguments are filled with nil, single Array arguments are deconstructed if the proc has multiple arguments, and there is no error raised on extra arguments.

- **Blocks**: A block is a chunk of code enclosed in {} or do...end. 
  - Usage: Blocks are commonly used with methods like each, map, and times.

      ``[1, 2, 3].each { |x| puts x }``

  - Implicit: Blocks are not objects and cannot be stored in variables. They are passed implicitly to methods.


- **yield**: is a keyword used to execute a block that is passed to a method.
  ```rb
  def my_method
    puts "Before yield"
    yield  # Calls the block passed to the method
    puts "After yield"
  end

  my_method { puts "Inside the block!" }
  
   #You can pass arguments to yield, which are then passed to the block.
  def my_method
    yield(10)  # Passes 10 to the block
  end

  my_method { |x| puts "Received: #{x}" }
  
  #If a method uses yield but no block is provided, Ruby will raise a LocalJumpError.
  #To avoid this, you can use block_given? to check if a block was passed.
  def my_method
    if block_given?
      yield
    else
      puts "No block given."
    end
  end

  my_method
  my_method { puts "Block given!" }  # Block given!

  ```


- **yield** is specifically for calling blocks passed to a method, while **Procs** and **Lambdas** are objects that encapsulate blocks and can be stored in variables or passed around.



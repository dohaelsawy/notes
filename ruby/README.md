## Notes on learn ruby language 

basics from [GoRails](https://gorails.com/episodes/strings-in-ruby?autoplay=1) series 


### General infos

- type **irb** in terminal and it opens a REPL session 

- difference between `puts 2+2` and `print 2+2` is both display 4 as output but puts adds newline and print doesn't 

- object **.class** is returning the class type of that object 

- any method that ends with **?** return boolean

- only false and nil are considered false and any other thing is true


### Strings

- **string interpolation** is be done via `#{}` for example `"score is #{4+2}"` the output is `score is 6`

- **sub** method takes 2 argument, first is the string need to change and second is the replacement of that string but only change the first occurrence 

- **gsub** the same as **sub** but change any occurrence of the replacement

- the replacement can be a regular expression 

- **include?** checks if the string has a specific part and return whether true or false  

- 
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
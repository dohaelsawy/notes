# Intermediate Python Course

## Resource

- [Intermediate Python Course on youtube](https://www.youtube.com/watch?v=HGOBQPFzWKo)

## List

- empty list
  ```py
  empty_list = list()
  ```
- check item in list
  ```py
  my_list = [1,2,3,4]
  if 4 in my_list:
      print("yahoo")
  else:
      print("not yet")
  ```
- append item at specify index
  ```py
  my_list.insert(1,6)
  print(my_list) # [1,6,2,3,4]
  ```
- remove item in list
  ```py
  my_list(4)
  print(my_list) # [1,6,2,3]
  ```
- remove all items inside list
  ```py
  my_list.clear
  print(my_list) # []
  ```
- difference between _my_list.sort()_ and _sorted()_:
  my_list.sort(): change the original list, while sorted(): doesn't change the original and return a new list which is sorted.
- repeat items inside a list
  ```py
  new_list = [8] * 7
  print(new_list) # [8,8,8,8,8,8,8]
  ```
- slicing a list
  ```py
  my_list = [1,2,3,4,5,6]
  new_list = my_list[::3] # [start:end which is not included:steps]
  print(new_list) # [1,4]
  ```
- copy from a list

  ```py
  my_list = [1,2,3,4,5,6]
  new_list = my_list # this will assign 2 list in the same place in memory
  new_list.append(7) # even if the append in new_list, but my_list will have item 7 too

  # 3 options to avoid this by
  # 1 - use copy method
  new_list = my_list.copy()
  # 2 - use list()
  new_list = list(my_list)
  # 3 - use slicing
  new_list = my_list[:]
  ```

- list comprehension
  ```py
  my_list = [1,2,3,4,5,6,7]
  double_list = [i*2 for i in my_list] # [expression for loop over a list]
  print(double_list) # [2,4,6,8,10,12,14]
  ```

## Tuples

- create tuple of 1 item

  ```py
  my_tuple = ('abc')
  print(type(my_tuple)) # <class 'str'>

  #1
  my_tuple = ('abc',) # should place a ',' at the end
  print(type(my_tuple)) # <class 'tuple'>

  #2
  # use tuple build in function
  my_tuple = tuple('abc',) # should place a ',' at the end
  print(type(my_tuple)) # <class 'tuple'>

  my_list = [1,2,3,4]
  new_tuple = tuple(my_list)
  print(type(new_tuple)) # <class 'tuple'>
  ```

- indexing, slicing and checking items as list
- count how many items in tuple
  ```py
  my_tuple = (1,2,3,4,5,6,6)
  print(my_tuple.count(6)) # 2
  ```
- return the first appearance of item in tuple
  ```py
  my_tuple = (1,2,3,4,5,6,6)
  print(my_tuple.index(3)) # 2
  ```
- tuple to list
  ```py
  my_tuple = (1,2,3,4)
  my_list = list(my_tuple)
  print(type(my_list)) # <class 'list'>
  ```
- unpacking

  ```py
  #1 - variables should match the items in the tuple
  new_tuple = 'one', 2 , 'three'
  v1,v2,v3 = new_tuple
  print(v1) # one
  print(v2) # 2
  print(v3) # three

  #2 - assign multiple items as list to 1 var
  new_tuple = 'one', 2 , 'three', 4, 5
  v1,*v2,v3 = new_tuple
  print(v1) # one
  print(v2) # [2,'three',4]
  print(v3) # 5
  ```

- tuples is more efficient, take less bytes for the system even if list and tuple has the same values

## Dictionaries

- delete kay and its value
  ```py
  my_dict = {"name":"doha", "age":22}
  #1
  del my_dict["age"]
  print(my_dict) # {'name':'doha'}
  #2
  my_dict.pop('name')
  print(my_dict) #{}
  ```
- looping over a dictionary

  ```py
  #1 by keys
  my_dict = {"name":"doha", "age":22}

  for key in my_dict :
      print(key) # name <newline> age
  for key in my_dict.keys() :
      print(key) # name <newline> age

  #2 by values
  for values in my_dict.values() :
      print(key) # doha <newline> 22

  #3 by both
  for key, values in my_dict.items() :
      print(key, value) # name doha <newline> age 22
  ```

- copying as list
- merging using `update()`

  ```py
  my_dict1 = {"name":"doha", "age":22}
  my_dict2 = {"last_name":"elsawy"}

  my_dict1.update(my_dict2)
  print(my_dict1) # {'name': 'doha', 'age': 22, 'last_name': 'elsawy'}
  ```

- can't use list as key but tuple, int, string can

## Sets

- set creation using `{}` or `set()`
- empty set using `{}` will make it as dict so use `set()` instead
- adding items using `add()` and remove using `remove()` but raise an error if item is not exist in a list but `discard()` ignore the exception and does nothing, using `pop()` will return an arbitrary umber and remove it
- checking and looping as lists
- combine elements from 2 sets without duplications `set3 = set1.union(set2)`
- intersection between 2 sets using `set3 = set1.intersection(set2)`
- difference between 2 sets `set3 = set1.difference(set2)`
- symmetric difference returns a set with all elements from set1 and set2 but not the elements that are in both sets `set3 = set1.symmetric_difference(set2)`
- these methods return a new set and doesn't modify the original one
- to modify the set use `update()` method and all its version for pervious methods for ex. `intersection_update()` and so one
- `issupset()` returns a boolean if the set is a supset of another set
- `issuperset()` returns a boolean if the first set has all the items from the second set
- `isdisjoint()` return a boolean if no intersection between 2 sets
- coping as lists
- make a consistent set that doesn't change using `frozenset([1,2,3,4])`

## Strings

- can't change or re-assign a item of string because strings are **immutable**
  ```py
  my_str = "name"
  my_str[0] = 'x'
  print(my_str)
  # TypeError: 'str' object does not support item assignment
  ```
- can check on sup-string using _if in_
  ```py
  my_str = "name"
  if 'x' in my_str:
      print("yaahh")
  else:
      print("nooo") # nooo
  ```
- slicing, looping and checking as lists
- remove white spaces using `strip()` but it doesn't change the original string so reassign it again to the same string
  ```py
  my_str = "   name   "
  my_str = my_str.strip()
  print(my_str) # name without white spaces
  ```
- `startswith()` and `endswith()` checks if the strings starts and ends with specific words or characters
- `find()` takes a supstring or char and return the first index it starts with
- `replace()` takes 2 arguments, the word that need to be replaced and the replacement word, and returns a new string and original doesn't change
- `split()` by default splits the string by spaces and return a new list, we can send any other delimiter `split(',')`
- `join()` concatenate the list of strings into a string, it takes a list and return a string, the delimiter between items of list is decided by the string the call the join on

  ```py
  my_list = ['hello', 'world']
  str_with_no_space = ''.join(my_list)
  print(str_with_no_space) # helloworld

  str_with_space = ' '.join(my_list)
  print(str_with_space) # hello world

  str_with_colon = ':'.join(my_list)
  print(str_with_colon) # hello:world
  ```

## Collection

- 1. **Counter**

  - id a container that stores the elements as dictionary keys and their counts as dictionary values.
  - have several methods, as default dictionary, `items()`, `values()`, `keys()`
  - have a `most_common(2)` that takes a number of most comment items, and returns a list of Tuples

    ```py
    from collections import Counter

    x = 'aaabbbbbbccccccc'

    my_c = Counter(x)
    print(my_c.most_common(1))  # [('c', 7)]
    print(my_c.most_common(1)[0])  # ('c', 7)
    print(my_c.most_common(1)[0][1])  # 7
    ```

- 2. **namedtuple**

  - easy to create and lightweight **object** type that is similar to struct
  - passed a _class name_, _fields inside the struct or class_

    ```py
    from collections import namedtuple

    Point = namedtuple('Point', 'x,y')
    pt =  Point(1,-4)
    print(pt.x, pt.y) # 1 -4
    ```

- 3. **defaultdict**

  - set a default values to dictionary, could be list or int, float any datatype

    ```py
    from collections import defaultdict

    my_dict = defaultdict(int)
    print(my_dict['un-exist-key']) # 0
    ```

- 4. **deque**

  - double ended queue, can be add or remove items from both sides

    ```py
    from collections import deque

    d = deque()

    d.append(1)
    d.append(2) # append items to the most right

    d.appendleft(3) # append items to the most left

    d.pop() # remove items from most right
    d.popleft() # remove items from most left

    d.extend([4,5,6]) # add items to queue to the most right
    d.extendleft([4,5,6]) # add items to queue to the most left
    # output : [6,5,4,3,2,1]

    d.rotate(1) # rotate items by 1 or any negative number is rotation by left
    ```

## Itertools

- Collection of tools to handel iterators

- 1. **product**

  - calculate the _cartesian product_ between lists

    ```py
    from itertools import product

    a = [1,2]
    b = [3,4]

    prod = product(a,b)

    print(list(prod)) #[(1, 3), (1, 4), (2, 3), (2, 4)]
    ```

- 2. **permutations**

  - a way of changing or arranging the elements or objects in a linear order.

    ```py
    from itertools import permutations

    a = [1,2,3]

    prem = permutations(a)

    print(list(prem)) # [(1, 2, 3), (1, 3, 2), (2, 1, 3), (2, 3, 1), (3, 1, 2), (3, 2, 1)]
    ```

- 3. **combinations**

  - makes all possible combinations with specified length

    ```py
    from itertools import combinations

    a = [1,2,3]

    comb = combinations(a,2)

    print(list(comb)) # [(1, 2), (1, 3), (2, 3)]
    ```

- 4. **accumulate**

  - accumulates and sums the list one by one

    ```py
    from itertools import accumulate

    a = [1,2,3]

    acc = accumulate(a)

    print(list(acc)) # [1,3,6]
    ```

  - takes a function that can specify based on it

    ```py
    from itertools import accumulate
    import operator

    a = [1,2,3]

    acc = accumulate(a, func=operator.mul)

    print(list(acc)) # [1,2,6]


    a = [1,2,1,5,3]

    acc = accumulate(a, func=max)

    print(list(acc)) # [1,2,2,5,5]
    ```

- 5. **groupby**

  - makes an iterator that returns keys and groups from an inner rebel

    ```py
    from itertools import groupby

    def smaller_than_3(x):
        return x < 3

    a = [1,2,3,4]

    group_obj = groupby(a, key=smaller_than_3)
    for key, value in group_obj:
        print(key, list(value))
        # True [1, 2]
        # False [3, 4]

    # using lambda function
    group_obj = groupby(a, key=lambda x: x<3)
    for key, value in group_obj:
        print(key, list(value))
        # True [1, 2]
        # False [3, 4]

    # good example

    people = [
        {
            'name':'doha',
            'age':22,
        },
        {
            'name':'rofy',
            'age':22,
        },
        {
            'name':'nora',
            'age':16,
        },
        {
            'name':'mohamed',
            'age':19,
        }
    ]

    group_obj = groupby(a, key=lambda x: x['age'])
    for key, value in group_obj:
        print(key, list(value))

        '''
        22 [{'name': 'doha', 'age': 22}, {'name': 'rofy', 'age': 22}]
        16 [{'name': 'nora', 'age': 16}]
        19 [{'name': 'mohamed', 'age': 19}]
        '''
    ```

- 6. **infinite iterators**

     ```py
     from itertools import count, cycle, repeat

     for i in count(10): # starts at 10 to infinite
         print(i)


     a = [1,2,3,4]
     for i in cycle(a): # cycle through list a to infinite
         print(i)


     for i in repeat(4,8): # repeats number 4 to 8 times and if not specify a number it will go infinite
         print(i)
     ```

## Lambda Function

- small one line anonymous function that defines without a name
- writes as -> lambda arguments: expression

  ```py
  add10 = lambda x: x+10

  print(add10(5)) # 15

  mult = lambda x,y: x * y

  print(mult(10,4)) # 40
  ```

- in _sorted_ function, which will receive an item

  ```py
  pints2D = [(1,2), (5,-1),(3,0)]

  pt2D_sorted = sorted(points2D,lambda x: x[1])
  print(pt2D_sorted) # [(5,-1),(3,0),(1,2)]
  ```

- in _filter_ function, which is takes a function and a iterable object/variable
  ```py
  a = [1,2,3,4,5]
  b = filter(lambda x: x%2==0, a)
  print(list(b)) # [2,4]
  ```

## Exceptions and Errors

- **raise Exception("message")** raise a custom error
- **assert(expression), message** raise an assertion error and if message exist it appears
- **try and except** try some code if error raise, it will go to except, and can catch the exception like , `except Exception as e` and then i can print the e, if `finally` exists, then it will print anyway, `else` can be there too and execute if no exception occur, and if both exist, will both execute.

## Logging

- 5 essential levels, debug, info, warning, error, critical, they indicate the security of the events
- the default is from warning to above is printed to console, can change this in basic configurations
- one of the best practice to name the logger with the model name
  ```py
  import logging
  logger = logging.getLogger(__name__) # any message from this logger with have the name of its model
  ```
- by default all loggers added to the hierarchy, starts at the root level and propagate their messages to the base logger
  ```py
  import logging
  logger = logging.getLogger(__name__)
  logger.propagate = False # turn the default propagation to false
  ```
- lock handlers, are responsible for dispatching the appropriate lock message to the handlers specific destination, could be file, http, or email.

  ```py
  import logging
  logger = logging.getLogger(__name__)

  stream_h = logging.StreamHandler() # print logs to stream
  file_h = logging.FileHandler('file.log') # this will create a file contains logs

  formatter = logging.Formatter('%(name) - %(levelname)s - %(message)s')

  ```

- capture stack traces: include exception trace to logs

  ```py
  import logging
  import traceback

  try:
      a = [1, 2, 3]
      value = a[3]
  except:
      logging.error("uncaught exception: %s", traceback.format_exc())
  ```

- Rotating FileHandler: keep the files small, when the log reaches a certain number of bytes, it gets "rolled over"

  ```py
  import logging
  from logging.handlers import RotatingFileHandler

  logger = logging.getLogger(__name__)
  logger.setLevel(logging.INFO)

  # roll over after 2KB, and keep backup logs app.log.1, app.log.2 , etc.
  handler = RotatingFileHandler('app.log', maxBytes=2000, backupCount=5)
  logger.addHandler(handler)

  for _ in range(10000):
      logger.info('Hello, world!')
  ```

- Logging Json Format: suggest open source JSON Logger [ https://github.com/madzak/python-json-logger](https://github.com/madzak/python-json-logger)

## JSON

- `json.dumps()` converts python objects into json string, called serialization or encoding
  ```py
  import json
  person = {
      "name":"doha",
      "city": ["egypt", "tokyo"]
  }
  p_json = json.dumps(person, indent=4, sort_keys=True) # sort the in json object
  ```
- `json.loads()` converts json object from string to a python dictionary, called deserialization or decoding

  ```py
  import json
  # Serialization
  person = {
      "name":"doha",
      "city": ["egypt", "tokyo"]
  }
  p_json = json.dumps(person, indent=4, sort_keys=True)

  # Deserialization
  person = json.loads(p_json)
  ```

- `json.load()` converts json object from file to a python dictionary
- custom encoding to python classes

  ```py
  import json
  class User:
      def __init__(self,name):
          self.name = name

  def encode_user(obj):
      if isinstance(obj, User):
          return {'name':obj.name, obj.__class__.__name__ = True}

  user_obj = User("doha")
  userJson = json.dumps(user_obj, default=encode_user)
  ```

- `json.loads(object_hook=decode_custom_func)` this property uses the custom decode method to decode specific object

## Random Numbers

- the `random` module

  ```py
   import random

  # random float in [0,1)
  a = random.random()
  print(a)

  # random float in range [a,b]
  a = random.uniform(1,10)
  print(a)

  # random integer in range [a,b]. b is included
  a = random.randint(1,10)
  print(a)

  # random integer in range [a,b). b is excluded
  a = random.randrange(1,10)
  print(a)

  # random float from a normal distribution with mu and sigma
  a = random.normalvariate(0, 1)
  print(a)

  # choose a random element from a sequence
  a = random.choice(list("ABCDEFGHI"))
  print(a)

  # choose k unique random elements from a sequence
  a = random.sample(list("ABCDEFGHI"), 3)
  print(a)

  # choose k elements with replacement, and return k sized list
  a = random.choices(list("ABCDEFGHI"),k=3)
  print(a)

  # shuffle list in place
  a = list("ABCDEFGHI")
  random.shuffle(a)
  print(a)
  ```

- `random.seed()` make results reproducible, and the chain of calls after `random.seed()` will produce the same trail of data.
- `secret` module used for generate cryptographically strong random numbers suitable for managing data such as passwords

  ```py
  import secrets

  # random integer in range [0, n).
  a = secrets.randbelow(10)
  print(a)

  # return an integer with k random bits.
  a = secrets.randbits(5)
  print(a)

  # choose a random element from a sequence
  a = secrets.choice(list("ABCDEFGHI"))
  print(a)
  ```

- `numpy` module create numbers for n-d arrays
- Importantly, seeding the Python pseudorandom number generator does not impact the NumPy pseudorandom number generator.

  ```py
  import numpy as np

  np.random.seed(1)
  # rand(d0,d1,…,dn)
  # generate nd array with random floats, arrays has size (d0,d1,…,dn)
  print(np.random.rand(3))
  # reset the seed
  np.random.seed(1)
  print(np.random.rand(3))

  # generate nd array with random integers in range [a,b) with size n
  values = np.random.randint(0, 10, (5,3))
  print(values)

  # generate nd array with Gaussian values, array has size (d0,d1,…,dn)
  # values from standard normal distribution with mean 0.0 and standard deviation 1.0
  values = np.random.randn(5)
  print(values)

  # randomly shuffle a nd array.
  # only shuffles the array along the first axis of a multi-dimensional array
  arr = np.array([[1,2,3], [4,5,6], [7,8,9]])
  np.random.shuffle(arr)
  print(arr)
  ```

## Decorators

- 2 different Decorators: Function Decorators and Class Decorators
- Function Decorator: function that takes another function as argument and extends the behavior of this function without explicitly modifying it.

  ```py
  def func_dec(func):
      def wrapper():
          print("start")
          func()
          print("End")
      return wrapper

  @func_dec
  # x = func_dec(print_name)
  def print_name():
      print("hello")


  print_name()
  # x()
  ```

- to pass arguments to function, use `*args` and `**kwagrs` in wrapper function and pass them too to the desired function

  ```py
  def func_dec(func):
      def wrapper(*args, **kwargs):
          print("start")
          result = func(*args, **kwargs)
          print("End")
          return result
      return wrapper


  @func_dec
  def print_name(name):
      print(f"hello {name}")



  print_name("doha")
  ```

- function identity: is the python figure out what is the running function, by the pervious code, python will think that the running function is the `wrapper` function and to fix this; import `functools` package

  ```py
  import functools

  def func_dec(func):
      @functools.wraps(func)
      def wrapper(*args, **kwargs):
          print("start") #1
          result = func(*args, **kwargs)
          print("End") #3
          return result
      return wrapper


  @func_dec
  def print_name(name):
      print(f"hello {name}")

  print_name("doha") #2
  print(print_name.__name__) #4
  ```

- what about decorator function with args,

  ```py
  def repeat(num_times):
      def decorator_repeat(func):

          @functools.wraps(func)
          def wrapper(*args,**kwargs):
              for _ in range(num_times):
                  res = func(*args, **kwargs)
              return res
          return wrapper
      return decorator_repeat


  @repeat(num_times=3) # -> this is the decorator
  def print_name(name):
      print(f"hello {name}")

  print_name("doha")
  ```

- class decorator:

  ```py
  import functools

  class CountCalls:
      # the init needs to have the func as argument and stores it
      def __init__(self, func):
          functools.update_wrapper(self, func) # instead of functools.wraps to preserve the information about our function.
          self.func = func
          self.num_calls = 0

      # extend functionality, execute function, and return the result
      def __call__(self, *args, **kwargs):
          self.num_calls += 1
          print(f"Call {self.num_calls} of {self.func.__name__!r}")
          return self.func(*args, **kwargs)

  @CountCalls
  def say_hello(num):
      print("Hello!")

  say_hello(5)
  say_hello(5)
  ```

## Generators

- Generators: are functions that return an object that can be iterated over, they generate the items inside the object lazily aka generate the object one in a time and only if i asked for it

- A generator is defined like a normal function but with the yield statement instead of return.
  ```py
  def my_generator():
      yield 1
      yield 2
      yield 3
  ```
- benefits: they are very memory efficient when working in large data

## Function Arguments

- positional argument: passing arguments in function call by assignment

  ```py
  def foo(a: int, b: int, c: int):
    print(f"a={a}, b={b}, c={c}")

  foo(b=6, c=4, a=2) # valid
  foo(2, b=6, c=4)   # valid
  foo(2, b=6, 4)     # not valid
  foo(2, b=6, a=2)   # not valid
  ```

- default arguments: function may or may not receive a value of the default parameter, if received then use the received value if not use the default one.
- must pass the default parameters at the end of arguments list in function definition.

  ```py
  def foo(a: int, b: int, c: int, d: int = 6):
    print(f"a={a}, b={b}, c={c} and d={d}")

  foo(1,2,3) # output: a=1, b=2, c=3, d=6
  foo(1,2,3,5) # output: a=1, b=2, c=3, d=5
  ```

- `*args` and `**kwargs`:

  - the variable that starts with `*` is tuple and can iterate over that var, the variable that starts with `**` is for key-value aka - dictionary -
  - they are optional so can be sent with arguments or not

    ```py
    def foo(a: int, b: int, *args, **kwargs):
      print(a, b)
      for arg in args:
        print(arg)
      for key in kwargs:
        print(key, kwargs[key])

    foo(1, 2, 3, 4, x=8) # 1->a, 2->b, (3,4)->args, x=8->kwargs
    ```

- unpacking:
- works with lists and tuples
- should has the same length of arguments in calling function

```py
 def foo(a,b,c):
   print(a,b,c)

 num_list = [1,2,3]
 foo(*my_list)
```

- for dictionary, the keys must match the name of function arguments

```py
 def foo(a,b,c):
   print(a,b,c)
 num_dict = {'a': 1, 'b':2, 'c':3}
 foo(**num_dict)
```

- mutable objects can be changed, immutable objects can not be changed,
  but mutable objects has a immutable objects inside can be changed, unless rebind the reference in the method then the reference is not change outside the method

```py
# Rebind a mutable reference -> no change
def foo(a_list):
    a_list = [50, 60, 70] # a_list is now a new local variable within the function
    a_list.append(50)

my_list = [1, 2, 3]
print('my_list before foo():', my_list)
foo(my_list) # [1,2,3]
print('my_list after foo():', my_list)
```

## Asterisk operator

- multiplication `*`
- power `**`
- repeat items in a list/tuple/strings `my_list = [0,1] * 3 # [0,1,0,1,0,1]`
- argus and kwargs
- unpacking a list/tuple/dict

  ```py
  nums = [1, 2, 3, 4, 5, 6]
  first, *middle, last = nums

  print(first) # 1
  print(middle) # list [2,3,4,5]
  print(last) # 6
  ```

## Shallow VS Deep copying
- shallow copies: Only one level deep. It creates a new collection object and populates it with references to the nested objects. This means modyfing a nested object in the copy deeper than one level affects the original.
  ```py
  import copy
  list_a = [1, 2, 3, 4, 5]
  list_b = copy.copy(list_a)

  # not affects the other list
  list_b[0] = -10
  print(list_a)
  print(list_b)
  # [1, 2, 3, 4, 5]
  # [-10, 2, 3, 4, 5]



  import copy
  list_a = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]]
  list_b = copy.copy(list_a)

  # affects the other!
  list_a[0][0]= -10
  print(list_a)
  print(list_b)



  # shallow copies
  list_b = list(list_a)
  list_b = list_a[:]
  list_b = list_a.copy()
  ```
- deep copies: A full independent clone. It creates a new collection object and then recursively populates it with copies of the nested objects found in the original.
  ```py 
  import copy
  list_a = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 10]]
  list_b = copy.deepcopy(list_a)

  # not affects the other
  list_a[0][0]= -10
  print(list_a)
  print(list_b)

  ```


## Context Managers 
-  Context managers are a great tool for resource management. They allow you to allocate and release resources precisely when you want to.
  ```py
  with open('notes.txt', 'w') as f:
    f.write('some todo...') 
  ```
  This will open a file and makes sure to automatically close it after program execution leaves the context of the with statement. It also handles exceptions and makes sure to properly close the file even in case of an exception.
  

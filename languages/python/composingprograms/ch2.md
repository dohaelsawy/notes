# Chapter 2: Building Abstractions with Data

## 2.2   Data Abstraction
- data abstraction isolates how a compound data value is used from the details of how it is constructed.
- The basic idea of data abstraction is to structure programs so that they operate on abstract data. That is, our programs should use data in such a way as to make as few assumptions about the data as possible. At the same time, a concrete data representation is defined as an independent part of the program.
- Data abstraction is a programming concept where you separate what a piece of data represents (its meaning) from how it’s implemented.
- compound data because they combine multiple values into one unit.


## 2.3   Sequences
* **2.3.3   Sequence Processing**
    - Sequence Unpacking -> binding multiple names to multiple values in a fixed length sequence 
    ```py
    pair = [[1,2],[2,2],[3,2]]
    for x, y in pair:
        if x == y:
            same_count += 1
    >>> same_count 
    1
    ```
    - List Comprehensions -> is an expression that preforms such a computations, evaluating a fixed expression for each element in a sequence and collecting the resulting values in a result sequence.
        
        - The for keyword above is not part of a for statement, but instead part of a list comprehension because it is contained within square brackets. The sub-expression x+1 is evaluated with x bound to each element of odds in turn, and the resulting values are collected into a list.
        ```py
        >>> odds = [1, 3, 5, 7, 9]
        >>> [x+1 for x in odds]
        [2, 4, 6, 8, 10]
        ```

        - Another common sequence processing operation is to select a subset of values that satisfy some condition. 
        ```py
        >>> [x for x in odds if 25 % x == 0]
        [1, 5]
        ```

        - To evaluate a list comprehension, Python evaluates the <sequence expression>, which must return an iterable value. Then, for each element in order, the element value is bound to <name>, the filter expression is evaluated, and if it yields a true value, the map expression is evaluated. The values of the map expression are collected into a list.
        `[<map expression> for <name> in <sequence expression> if <filter expression>]`


    - apply higher order functions in sequence processing -> evaluating an  expression for each element in a sequence by applying a function to each element 
    ```py
    >>>  def keep_if(filter_fn, s):
            return [x for x in s if filter_fn(x)]
    >>> def divisors_of(n):
            divisor_n = lambda x: n % x == 0
            return [1] + keep_if(divisor_n, range(2,n))
    ```

    - In Python programs, it is more common to use list comprehensions directly rather than higher-order functions, but both approaches to sequence processing are widely used.

* **2.3.4   Sequence Abstraction**
    - membership -> value is check for its membership in a sequence using `in` and `not in` operators 
        - for strings membership -> the membership operator in applies to strings, but has an entirely different behavior than when it is applied to sequences. It matches substrings rather than elements.
        ```py
        >>> 'here' in "Where's Waldo?"
        True
        ```
* **2.3.6   Trees**
    - TO BE CONTINUE 
* **.3.7   Linked Lists**
    - TO BE CONTINUE 



## 2.4   Mutable Data
- objects combine data values with behavior 
- Objects are both information and processes, bundled together to represent the properties, interactions, and behaviors of complex things.
- `is` and `is not`, that test whether two expressions in fact evaluate to the identical object.
- **identical** if they are equal in their current value, and any change to one will always be reflected in the other. Identity is a stronger condition than equality
- List comprehensions. A list comprehension always creates a new list.
- Dictionaries also have a comprehension syntax analogous to those of lists. A key expression and a value expression are separated by a colon. Evaluating a dictionary comprehension creates a new dictionary object.
```py
>>> {x: x*x for x in range(3,6)}
{3: 9, 4: 16, 5: 25}
```
- **Message Passing**: is a way of structuring communication between entities by exchanging messages. encapsulates the logic for all operations on a data value within one function that responds to different messages. 

- **local state**: can achieved using mutable objects allowing functions to remember values between calls
```py
1	def make_withdraw(balance):
2	    def withdraw(amount):
3	        nonlocal balance
4	        if amount > balance:
5	            return 'Insufficient funds'
6	        balance = balance - amount
7	        return balance
8	    return withdraw
9	
10	wd = make_withdraw(20)
11	wd(5)
12	wd(3)
``` 


- explanation of constraint system : https://grok.com/share/bGVnYWN5_c524f30d-4dfb-45c2-84e8-453ff0092238


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
- difference between *my_list.sort()* and *sorted()*:
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
- can check on sup-string using *if in* 
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
    - passed a *class name*, *fields inside the struct or class*
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
    - calculate the *cartesian product* between lists
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
- in *sorted* function, which will receive an item 
    ```py
    pints2D = [(1,2), (5,-1),(3,0)]

    pt2D_sorted = sorted(points2D,lambda x: x[1])
    print(pt2D_sorted) # [(5,-1),(3,0),(1,2)]
    ```
- in *filter* function, which is takes a function and a iterable object/variable
    ```py
    a = [1,2,3,4,5]
    b = filter(lambda x: x%2==0, a)
    print(list(b)) # [2,4]
    ```


## Exceptions and Errors

- **raise Exception("message")** raise a custom error 
- **assert(expression), message** raise an assertion error and if message exist it appears 
- **try and except** try some code if error raise, it will go to except, and can catch the exception like , `except Exception as e` and then i can print the e, if `finally` exists, then it will print anyway, `else` can be there too and execute if no exception occur, and if both exist, will both execute.


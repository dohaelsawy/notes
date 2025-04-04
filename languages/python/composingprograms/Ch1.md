# Chapter 1: Building Abstractions with Functions

## 1.1   Getting Started

- Statements and Expressions -> computer programs consists of instructions to either : - compute some value - carry out some actions 
    - statements are describe actions, it carry out some actions when the interpreter execute the statement 
    - expressions are describe computations, when python evaluate a expression, it computes the value of that expression 
- Functions -> encapsulate logic that manipulates data.
- Objects -> bundles together data and the logic that manipulates that data in a way that manages the complexity of both.
- Interpreter -> is a program that implement such a procedure, evaluating compound expressions 
- Errors -> 
    - Test Incrementally: Try out everything you write as soon as possible to identify problems early and gain confidence in your components.
    - Isolate Errors: trace the error to the smallest fragment of code you can before trying to correct it.
    - Check Your Assumption: Know your assumptions, then focus your debugging effort on verifying that your assumptions actually hold.

## 1.2 Elements of Programming

every powerful language has 3 such mechanisms:
- Primitive Expression and Statement: which represent the simplest building blocks that the language provides 
- Means of Combination: by which compound elements are built from simpler ones and
- Means of Abstractions: by which compound elements can be named and manipulated as units. 

- Call Expression: which applies a function to some arguments.
- Pure functions. Functions have some input (their arguments) and return some output (the result of applying them).
- Non-pure functions. In addition to returning a value, applying a non-pure function can generate side effects, which make some change to the state of the interpreter or computer
- `print()` output directly to console and returns `None`  

## 1.3   Defining New Functions

- Aspects of a functional abstraction: The domain of a function is the set of arguments it can take. The range of a function is the set of values it can return. The intent of a function is the relationship it computes between inputs and output (as well as any side effects it might generate).

## 1.6   Higher-Order Functions

- Abstraction: taking the common template shown above and transforming the "slots" into formal parameters
- Currying in Functions: function that accepts multiple arguments and breaking it ito a sequence of functions, where each function in the chain accepts one argument and returns another function until all arguments are collected. 
    - the single parameter is a convention rather that a hard rule 
    ```py
    def curry_add(a):
        def add_b(b):
            def add_c(c):
                return a + b + c
            return add_c
        return add_b

    result = curry_add(1)(2)(3)
    print(result)  # Output: 6
    ```
    - can be implemented using `functools.partial`
    ```py
    from functools import partial

    def multiply(a, b, c):
        return a * b * c

    # Partial application
    mul_by_2 = partial(multiply, 2)
    mul_by_6 = partial(mul_by_2, 3)
    result = mul_by_6(4)
    print(result)  # Output: 24
    ```

- lambda expression: evaluates to a function that has a single return expression as its body.

- nested functions: 
    - Nested functions have access to the variables in the enclosing (outer) function’s scope, in addition to their own local scope. This is known as lexical scoping.
    ```py
    def outer(x):
        def inner(y):
            return x + y
        return inner

    func = outer(5)
    print(func(3))  # Output: 8 (x is remembered as 5)
    ```
    - `**` is used to calculate exponentiation 

## 1.7   Recursive Functions
- When a recursive procedure is divided among two functions that call each other, the functions are said to be mutually recursive.

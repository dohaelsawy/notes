# Chapter 2 
- The `__name__` variable passed to the Flask class is a Python predefined variable, which is set to the name of the module in which it is used. 
- Flask uses the location of the module passed here as a starting point when it needs to load associated resources such as template files
- The app package is defined by the app directory and the `__init__.py` script, and is referenced in the from app import routes statement. The app variable is defined as an instance of class Flask in the `__init__.py` script, which makes it a member of the app package.
- decorators is to use them to register functions as callbacks for certain events. In this case, the @app.route decorator creates an association between the URL given as an argument and the function.
### Application and Request Contexts 
- for view function to obtain its job, it needs global access or it needs to get it as parameters but this will make overhead and makes complicated
- to avoid this; flask uses **contexts** to temporarily make certain objects globally accessible.
- but in fact it cannot be global, because of multithreading, each thread has different client with different request
- context enable flask to make certain variables globally accessible to thread without interfering with other threads/
- 2 context types: 1. *application context* 2. *request context*
- application contexts -> has so far 2 variables, 1. *current_app*: interface for the active application.  2. *g*: the object that the application can use for temporary storage during the handling of a request, reset with each request.
- request context -> has also 2 variables so far, 1. *request*: which encapsulates the contents of a http request sent by the client. 2. *session*: the user session, dictionary that the application can use to store values that are remembered between requests.
- first activate the contexts types, then use its variables, and then removes them when the request handled.


### Request Dispatching
- for serving the request with suites view function, flask looks up the URL given in the request in the application's URL map, which is have a map that link each view with ots url.
- building this map using *app.route decorators* or using *app.add_url_rule()*

### Request Hooks
- flask has request hooks which are used to register common functions to be invoked before or after a request is dispatched to a view function.
- implemented as decorators, and 4 hooks supported: 1. *before_first_request*: run before the first request is handled. 2. *before_request*: run before each request. 3. *after_request*: run after each request, if no unhandled exception occurred. 4. *teardown*: run after each request even if unhandled exception occurred.

- to share data between request hook functions and view functions by using *g* context global.


### Responses 

- the view function can return 2 or 3 arguments, the returned message, the status code, and a dictionary of headers that are added to http to the HTTP response. ex.
```py
@app.route('/')
def index():
    return '<h1>Bad Request</h1>', 400
```
- instead import make-response from flask that can take the same options as normal view function but return as *Response object*

- *redirect* gives the browser a new URL from which to load a new page. return also 302 status code and take the same 3 options and return an object of Response 

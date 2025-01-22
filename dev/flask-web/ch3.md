# Templates

### Introduction
- **Presentation Layer**: The layer at which users interact with the application and the final data will be visible to the users at this interface. It acts as an interface between the user and the application. **Business Logic Layer**: It acts as an intermediate between the Presentation and the Data Access Layer.

### Rendering Templates
- the function *render_template* from flask integrates the *Jinja2* templates engine, the function takes 2 arguments, the file name and a key/value pairs that represent the actual data 

### Variables 
- a special placeholder that tells the template engine that the value that goes in
that place should be obtained from data provided at the time the template is rendered.

- Variables can be modified with filters, which are added after the variable name with a pipe character as separator.

- **safe**: Renders the value without applying
escaping.
**capitalize**: Converts the first character of the value to uppercase and the rest to lowercase.
**lower**: Converts the value to lowercase characters.
**upper**: Converts the value to uppercase characters.
**title**: Capitalizes each word in the value.
**trim**: Removes leading and trailing whitespace from the value.
**striptags**: Removes any HTML tags from the value before rendering.

- Never use the safe filter on values that aren’t trusted, such as text entered by users on web forms.

### Control Structures

- if statements 
```html
{% if user %}
<p>Hello, {{ user }}!</p>
{% else %}
<p>Hello, Stranger!</p>
{% endif %}
``` 
- for-loop
```html
<ul>
{% for comment in comments %}
<li>{{ comment }}</li>
{% endfor %}
</ul>
```

- *macros*, which are similar to functions in Python code.
```html
{% macro render_comment(comment) %}
<li>{{ comment }}</li>
{% endmacro %}
<ul>
{% for comment in comments %}
{{ render_comment(comment) }}
{% endfor %}
</ul>
```

- templates inheritance: 
*Blocks* are given a unique name, which derived templates can reference when they provide their content.
```html
<!-- base template -->
<body>
    <div>Microblog: <a href="/index">Home</a></div>
    <hr>
    {% block content %}{% endblock %}
</body>
```
```html
<!-- user.html -->
{% extends "base.html" %}

{% block content %}
    <h1>Hi, {{ user.username }}!</h1>
{% endblock %}
```
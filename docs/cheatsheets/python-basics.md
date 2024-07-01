---
layout: article
title: Python Basics
description: A Python cheatsheet covering variables, data types, control structures, functions, file operations, classes, exceptions handling, modules, and virtual environments, with concise explanations and examples for all skill levels.
image: /assets/images/cheatsheets/python-basics-cover.png
cover: /assets/images/cheatsheets/python-basics-icon.png
tags: 
  - cheatsheets
  - python 
  - basics
date: 2024-04-01
author: 
   name: Ayush Jain
---

### Variables and Data Types

```python
# Integer
num = 10

# Float
pi = 3.14

# String
name = "John"

# Boolean
is_true = True
```

#### Lists
```python
my_list = [1, 2, 3, 4, 5]

# Accessing elements
print(my_list[0])  # Output: 1

# Slicing
print(my_list[1:3])  # Output: [2, 3]

# List methods
my_list.append(6)
my_list.pop()
```

### Control Structures
#### If-Else
```python
x = 10

if x > 5:
    print("x is greater than 5")
else:
    print("x is not greater than 5")
```

#### Loops
**For Loop**
```python
for i in range(5):
    print(i)
```

**While Loop**
```python
count = 0
while count < 5:
    print(count)
    count += 1
```

### Functions
```python
def greet(name):
    print("Hello, " + name + "!")
```

### File Operations
```python
# Writing to a file
with open("example.txt", "w") as f:
    f.write("Hello, World!")

# Reading from a file
with open("example.txt", "r") as f:
    content = f.read()
    print(content)
```

### Classes
```python
class Car:
    def __init__(self, make, model):
        self.make = make
        self.model = model

    def display_info(self):
        print(f"{self.make} {self.model}")
```

### Exceptions Handling
```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero!")
```

### Modules
```python
import math

print(math.sqrt(16))  # Output: 4.0
```

### Virtual Environments
```bash
# Create a virtual environment
python -m venv myenv

# Activate the virtual environment
source myenv/bin/activate

# Deactivate the virtual environment
deactivate
```
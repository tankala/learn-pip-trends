---
layout: article
title: Python Hunter
description: Hunter is a flexible code tracing toolkit.
tags: [python, hunter, tracing, debugging, logging, inspection]
image: /assets/images/getting-started/getting-started-python-hunter-cover.png
cover: /assets/images/getting-started/python-hunter.png
article_header:
  type: overlay
  theme: dark
  background_image:
    gradient: 'linear-gradient(135deg, #2BF29F, #FFFF00)'
date: 2024-02-14
author:
  name: Lavanya Mylapalli
---

## Introduction
Python Hunter is a versatile code tracing toolkit developed for debugging, logging, inspection, It is not meant for measuring the  coverage. It offers a simple Python API, a comfortable terminal API, and a command-line tool for attaching to processes. If you have any bugs in your code, and if you worry how to trace them, this is the best package that can help you. It will help you in tracing and understanding the flow of your code.Debugging the code is very challenging especially for beginners, it will behave as a debugging assistant that can help you in reavealing the hidden paths of your program that happens during execution.

## Installation
To install python hunter into your project, open your terminal and run the below command.

   ```python
   pip install hunter
   ```

### Importing the Trace

To get started, import the Python-Hunter trace that will accompany you on your hunt. Import it into your script like this, hunter.trace can take 2 types of arguments
- Keyword arguments include `module`, `function`, and `action`.
- Callbacks that accept event arguments
   - There are built-in predicates, such as `hunter.predicates.Query`, `hunter.When`, `hunter.And`or `hunter.Or`.
   - Actions like hunter.actions.CodePrinter, hunter.actions.Debugger or hunter actions.VarsPrinter
   - Any Custom function / lambda.

 ```python
   from hunter import trace
   
   trace(module='posixpath', action=hunter.CallPrinter)
   ```

### Defining the Rules
We can set the rules for python-hunter, for example if you want to track a specific function you can use the `Q` object like below

   ```python
   from hunter import Q

   def my_function():
       print("In the function")

   with trace(Q(my_function)):
       my_function()
   ```
   ```python

   from hunter import trace, Q, Debugger
   from pdb import Pdb
   trace(
      # drop into a Pdb session if ``foo.bar()`` is called
      Q(module="foo", function="bar", kind="call", action=Debugger(klass=Pdb))
      |  # or
      Q(
         # show code that contains "mumbo.jumbo" on the current line
         lambda event: event.locals.get("mumbo") == "jumbo",
         # and it's not in Python's stdlib
         stdlib=False,
         # and it contains "mumbo" on the current line
         source__contains="mumbo"
      )
   )
   import foo
   foo.func()
   ```
### Starting the Hunt
Once the rules are set, initiate the hunt using the `open_trace` function

   ```python
   from hunter import open_trace

   with open_trace() as trace_info:
       # Your code here
   ```

This captures information about your code execution.

### Examining the Hunted
   To see what your Python-Hunter found, check the captured events:

   ```python
   print(trace_info.events)
   ```
A list of all the keyword filters that hunter.trace or hunter.Q accept:

- arg - you probably don’t care about this - it may have a value for return/exception events
- builtin (bool) - True if function is a builtin function
- calls (int) - a call counter, you can use it to limit output by using a lt operator
- depth (int) - call depth, starts from 0, increases for call events and decreases for returns
- filename (str)
- fullsource (str) - sourcecode for the executed lines (may be multiple lines in some cases)
- function (str) - function name
- globals (dict) - global variables
- instruction (int or str, depending on Python version) - current executed bytecode, see Silenced exception runtime analysis for example usage
- kind (str) - one of ‘call’, ‘exception’, ‘line’ or ‘return’
- lineno (int)
- locals (dict) - local variables
- module (str) - dotted module
- source (str) - sourcecode for the executed line
- stdlib (bool) - True if module is from stdlib
- threadid (int)
- threadname (str) - whatever threading.Thread.name returns

### Getting Around the Python-Hunter

**Customizing Your Hunt**
   Python-Hunter is flexible – you can customize your hunt by setting specific conditions, making it more efficient for your debugging needs.

**Capturing Local Variables**
   The tracker can capture local variables, offering insights into the state of your program at different points during execution.

**Integration with Logging**
   Python-Hunter seamlessly integrates with Python's logging module, allowing you to incorporate it into your existing logging setup.

### Projects using Hunter**
Noteworthy usages or Hunter (submit a PR with your project if you built a tool that relies on hunter)

- Crunch-io/diagnose - a runtime instrumentation library.
- talwrii/huntrace - an alternative cli (similar to ltrace).
- anki-code/xunter - a profiling tool made specifically for the xonsh shell.
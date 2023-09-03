---
layout: article
title: Python Program to Add Two Numbers
description: Learn how to write a simple Python program to add two numbers and display the result.
keywords: python, addition, arithmetic, numbers, sample code, tutorial
tags: [python, addition, arithmetic, numbers, sample code, tutorial]
permalink: /sample-code/add-numbers.html
key: sample-add-numbers
date: 2023-08-02
comments: true
---

### We are going to write a Python Program to add two numbers

In the program below, we've used the + operator to add two numbers.

#### Example 1: Add Two Numbers

```python
# This program adds two numbers

num1 = 1.5
num2 = 6.3

# Add two numbers
sum = num1 + num2

# Display the sum
print('The sum of {0} and {1} is {2}'.format(num1, num2, sum))

```

#### Output

```bash
The sum of 1.5 and 6.3 is 7.8
The program below calculates the sum of two numbers entered by the user..
```


#### Example 2: Add Two Numbers With User Input

```python
# Store input numbers
num1 = input('Enter first number: ')
num2 = input('Enter second number: ')

# Add two numbers
sum = float(num1) + float(num2)

# Display the sum
print('The sum of {0} and {1} is {2}'.format(num1, num2, sum))
```

#### Output

```bash
Enter first number: 1.5
Enter second number: 6.3
The sum of 1.5 and 6.3 is 7.8
```

In this program, we asked the user to enter two numbers and this program displays the sum of two numbers entered by user.

We use the built-in function input() to take the input. Since, input() returns a string, we convert the string into number using the float() function. Then, the numbers are added.

Alternative to this, we can perform this addition in a single statement without using any variables as follows.

```python
print('The sum is %.1f' %(float(input('Enter first number: ')) + float(input('Enter second number: '))))
```

#### Output

```bash
Enter first number: 1.5
Enter second number: 6.3
The sum of 1.5 and 6.3 is 7.8
```

Although this program uses no variable (memory efficient), it is harder to read.
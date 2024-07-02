---
layout: article
title: BeautifulSoup4
description: BeautifulSoup4 is a Python Library for web scraping. This is a popular tool for extracting data from HTML and XML files.
tags: 
  - python
  - pip 
  - piptrends
  - beautifulsoup
  - beautifulsoup4
  - bs4
image: /assets/images/getting-started/beautifulsoup4-cover.png
cover: /assets/images/getting-started/beautifulsoup4-icon.png
date: 2023-12-14
author:
  name: Aman Clement
  twitter: aman_aranha
---

## What is Web Scraping?
We all come across webpages, and we have a generic idea of how webpages display content using different HTML tags. The process of downloading this HTML code to extract relevant information is called web scraping. Python provides various libraries to achieve this,namely [Scrapy, selenium, beautifulsoup4](https://piptrends.com/compare/Scrapy-vs-beautifulsoup4-vs-selenium){:target="_blank"}, Today we will be looking at one of the most famous one, [BeautifulSoup4](https://piptrends.com/package/beautifulsoup4){:target="_blank"}.

## Why BeautifulSoup?
BeautifulSoup is designed specifically for web scraping. It has a very user-friendly way to extract data from HTML files and parse XML documents. It has minimum dependencies, clean API,simple syntax, free to use and an active user community. 

## History and Trends
BeautifulSoup was initially developed as a project to scrape a website, its later versions allowed XML parsing (Version 2) and CSS selector (Version 3) support. The BeautifulSoup4 was a complete rewrite of the previous verisons offering support to Python3, Unicode support and a cleaner API.
The Current version(4.12.2) is well maintained and often used along with other libraries like Selenium and Pandas providing advanced web analysis and data scraping.

## Getting Started

Let's get started with an example, Consider an HTML document

```python
html_doc = """
<html>
<head>
<title>The Rabbit's story</title>
</head>

<body>
<p class="title"><b>The Rabbit's story</b></p>
<p class="story">Once upon a time there were three little rabbits; and their names were
<a href="http://example.com/bob" class="rabbit" id="link1">Bob</a>,
<a href="http://example.com/joe" class="rabbit" id="link2">Joe</a> and
<a href="http://example.com/jill" class="rabbit" id="link3">Jill</a>;
and they lived in a burrow.</p>

<h1><a href="/" class="continue" id="link4">The story continues ... </a></h1>
</body>
</html>
"""
```

Before we start extracting data, let us install the library :

```python
pip install beautifulsoup4
```

Import the beautifulsoup library :
```python
from bs4 import BeautifulSoup
```

Creating a BeautifulSoup object:
```python
soup = BeautifulSoup(html_doc, 'html.parser')
```

Now that we the bs4 object we can get started with extracting data, Here are some simple examples:

```python
## Retrieving the title tag :

> soup.title
# <title>The Rabbit's story</title>


## Retrieving the text from title tag : 

> soup.title.string
# u'The Rabbit's story'


## Retrieving text from nested tags:

> soup.h1.a.string 
# The story continues...


## Getting all the text from the html doc :

> print(soup.get_text())
# The Rabbit's story
#
# The Rabbit's story
#
# Once upon a time there were three little rabbits; and their names were
# Bob,
# Joe and
# Jill;
# and they lived in a burrow.
#
# The story continues ...
```

## BeautifulSoup Methods

A better and more recommended way to search the DOM tree is using the BeautifulSoup methods find() and find_all(), Let us get directly into working with the tags :

find() :
  Is it recommended to use find() when you know there is only one element on the page that matches your query because find() returns only the first match of your query.
  If you want to extract an element which does not have an unique tag_name, you need not worry as there are certain attributes that will help you to pinpoint your required element, Let us understand this better by working with an example.

```python
exampleHTML = """
<html>
<head>
<title>My First Page</title>
</head>
<body>
<h1>This is a heading</h1>
<p>This is a paragraph with <a href="https://google.com">link</a>.</p>
<div id="element1">This is a element</div>
<div class="special-class">This is a special element</div>
<div class="normal-class" id="element3">This is a normal element</div>
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>
</body>
</html>
"""

## Creating the BeautifulSoup object :
> soup = BeautifulSoup(exampleHTML, 'html.parser')

## Extracting The h1 element using find():
> heading = soup.find("h1")  
# <h1>This is a heading</h1>

## <div> Tag + Id :
> soup.find('div', id='element1') 
# <div id="element1">This is a element</div>

## Using attrs :

> soup.find('div', attrs={"class": "special-class"})
# <div class="special-class">This is a special element</div>

> soup.find('div', attrs={"class": "normal-class", "id": "element3"}).text
# This is a normal element
```

 find_all() : You should use the .find_all() method when there are multiple instances of the element on the page that matches your query. .find_all() returns an array of elements.

Let us go through this considering the previous example :
```python
## Finding all <li>
> soup.find_all('li')
# [ <li>Item 1</li>
#   <li>Item 2</li>
#   <li>Item 3</li>
# ]

## <div> Tag + Id :
> soup.find_all('div', id='element1') 
# <div id="element1">This is a element</div>

## Using attrs :

> soup.find_all('div', attrs={"class": "special-class"})
# <div class="special-class">This is a special element</div>

> soup.find_all('div', attrs={"class": "normal-class", "id": "element3"}).text
# This is a normal element

```

## CSS Selectors

BeautifulSoup also provides a .select() method to extend support for the use of CSS Selectors to extract data from a webpage. Let us look at some of the most commonly used selectors :

- .classes
- #ids
- [attributes=value]
- parent child
- parent > child
- sibling ~ sibling
- sibling + sibling
- :not(element.class, element2.class)
- :is(element.class, element2.class)
- parent:has(> child)

Select returns a list of elements similar to find_all(), the elements can be accesed by indices, for eg, use [0] for the first element to be accessed.

## XML Support
While BeautifulSoup4 can be used for both HTML and XML parsing, there are some small differences on how it functions, We will go through them one by one :

Creating Object : 
```python
# For HTML parsing
soup = BeautifulSoup(html_content, 'html.parser')  

# For XML parsing
soup = BeautifulSoup(xml_content, 'lxml')
```

Case Sensitive Tag Names and Attributes:
```python
# For HTML
soup.find_all('div')  # finds <div>, <DIV>, <DiV>, etc.

# For XML
soup.find_all('Element')  # only finds <Element>, not <element> or <ELEMENT>
```

Handling NameSpaces :
```python
""" For HTML
HTML, traditionally does not use namespaces. 
In HTML documents, elements and attributes are identified without namespace prefixes.
"""
# For XML
soup.find_all('ns:tag', {'ns': 'http://example.com/namespace'})
```

Document Structure:

HTML is usually more forgiving when it comes to malformed tags or documents with errors. Beautiful Soup is designed to handle these imperfections commonly found in HTML.
XML, on the other hand, is stricter, and documents must adhere to a well-formed structure. Beautiful Soup may not be as forgiving with poorly formed XML

## Further Reading

- [beautifulsoup4 4.12.2 Pypi](https://pypi.org/project/beautifulsoup4/){:target="_blank"}
- [beautifulsoup4](https://beautiful-soup-4.readthedocs.io/en/latest/){:target="_blank"}
- [TutorialsPoint - Quick guide](https://www.tutorialspoint.com/beautiful_soup/beautiful_soup_quick_guide.htm){:target="_blank"}

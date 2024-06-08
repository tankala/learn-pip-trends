---
layout: article
title: requests
description: A beginner's guide to Python's requests library, a powerful and user friendly tool for making HTTP requests.
tags: 
  - python
  - pip 
  - requests
  - HTTP
image: /assets/images/getting-started/requests-cover.png
cover: /assets/images/getting-started/requests-icon.png
date: 2024-01-08
author:
  name: Aman Clement
  twitter: aman_aranha
---

## What is Python Requests?
In our daily life, we come across various websites, applications and other entities on the internet. All these webpages are basically HTML and are communicating with each other using HTTP protocol. HTTP has various methods through which it interacts with web servers. This interaction is made possible in python thanks to various packages like [urllib3, aiohttp, requests, httpx](https://piptrends.com/compare/urllib3-vs-aiohttp-vs-requests-vs-httpx){:target="_blank"}, Here we will be focusing on [requests](https://piptrends.com/package/requests){:target="_blank"}.

## Background
Before we get started, let us have a clear picture of what requests actually does. As the name indicates requests is a popular tool for making HTTP requests. It provides support for both GET and POST requests to website which makes it easier to send any data to website, we will be looking at how to implement these shortly. Requests has over [338M downloads](https://piptrends.com/package/requests){:target="_blank"} per month and finds its application in web scrapping and other tasks that require making large number of queries as it provides methods to follow redirects, handle cookies, and authenticate with websites

## Getting Started

First and foremost let us install requests.
requests officially supports `Python 3.7+`

```python
pip install requests
```

If you prefer the use of `pipenv`, you can go with 
```python
pipenv install requests
```

Once this is done, you can use it in your application by importing it.

```python
import requests
```
requests has a very simple syntaxt and it is given by :
```python
requests.methodname(params)
```
The HTTP request returns a Response Object with all the response data (content, encoding, status, etc).

Here the methodname(params) can be :
- get(url, params, args)
- post(url, data, json, args)	
- delete(url, args)
- head(url, args)	
- patch(url, data, args)	
- put(url, data, args)

we shall go through each of these one by one.

## get Method

The get method in the requests library is used to send an HTTP GET request to a specified URL. This method allows you to retrieve information from a server.

```python
url = 'https​://example.com'
response = requests.get(url)
```

Here, url is the URL of the resource you want to retrieve. The `get` method sends a GET request to this URL, and the response is stored in the response variable.

We can further improve on this by including query parameters in the GET request by passing a dictionary to the params parameter.
For instance:

```python
params={'search': 'python'}
response = requests.get(url,params)
```
will send HTTP GET request `https​://example.com?search=python`. This is by default none. 

Similarly, other args can be included for additional request customization, commonly used options are headers, auth, timeout.

```python
response = requests.get(url,timeout=2.50)
```
The timeout=2.50 argument ensures that the request won't hang indefinitely if the server doesn't respond within 2.50 seconds.

## post Method

The `requests.post(url, data, json, args)` method is used to send a POST request to a specified URL. POST requests are designed to send data to a server to create or update it. Consider an example where we have a form and we want to upload files or submit the form, POST request does exactly that.

Let us understand this better by considering an example where we are submitting a form with two fields name and email address:

```python
data = {'name': 'John Doe', 'email': 'johndoe@example.com'}
response = requests.post('https://example.com/submit-form', data=data)
```

Similar to params in `get`, we use data/json/files here based on requirement. It is safer than `get` request as the contents of params in `get` are exposed in the url.
 
## delete Method

The `requests.delete(url, args)` is used to ask the server to delete a resource. It's commonly used to remove items from databases, delete files, or cancel actions.

```python
url = 'https://example.com/path/to/resource'
response = requests.delete(url)
```

## head Method

The `requests.head(url, args)` method is used to send an HTTP HEAD request to a specified URL. An HTTP HEAD request is similar to a get request, but the server is expected to return only the headers of the response, without the actual content of the requested resource. This can be useful when we are interested in obtaining information about a resource, such as its metadata or headers, without transferring the entire content.

```python
url = 'https://www.example.com'
response = requests.head(url)
```

The desired property of response object can be accessed by:
```python
print(f'Status Code: {response.status_code}')
print('Headers:')
print(response.headers)
```

## patch Method

A PATCH request is used to apply partial modifications to a resource on the server. The data sent in the request represents the changes that should be applied to the resource.

In the following example, url is the URL of the resource you want to update, and data is a dictionary containing the changes or modifications to be applied.
```python
url = 'https://www.example.com/resource/123'
data = {'key': 'new_value'}
response = requests.patch(url, data=data)
```

This method is used when we want to apply partial updates to a resource instead of replacing the entire resource.

## put Method

Unlike the `patch` method put method is used to replace or create a resource on the server. Which means that the data sent in the request represents the complete replacement of the resource or the creation of a new resource.

It's syntax is same as `patch` method
```python
url = 'https://www.example.com/resource/123'
data = {'key': 'new_value'}
response = requests.put(url, data=data)
```

## Parameter Values
Following are some params which can be used for addition request customizaton:

| Parameter      | Description |
| -----------    | ----------- |
| allow_redirects  | Optional. A Boolean to enable/disable redirection. Default False (not allowing redirects)   |
| auth   | Optional. A tuple to enable a certain HTTP authentication. Default None        |
| cert	     | Optional. A String or Tuple specifying a cert file or key. Default None       |
| cookies	   | Optional. A dictionary of cookies to send to the specified url. Default None     |
| headers    | 	Optional. A dictionary of HTTP headers to send to the specified url. Default None    |
| proxies   | Optional. A dictionary of the protocol to the proxy url. Default None      |
| stream	      | Optional. A Boolean indication if the response should be immediately downloaded (False) or streamed (True). Default False  |
| timeout   |Optional. A number, or a tuple, indicating how many seconds to wait for the client to make a connection and/or send a response. Default None which means the request will continue until the connection is closed    |
| verify   |	Optional. A Boolean or a String indication to verify the servers TLS certificate or not. Default True   |



## Response 

Every `requests.methodname(params)` produces a response object which is returned as a result of the HTTP request to the web server. This object can be accessed to verify if our query was successful or not or to extract the required information. 
There are three main things to focus on :
- Status Code
- Content
- Headers

Let us look at them one by one,

#### Status Code
A status code informs you of the status of the request if the request was successful or not.
A Status Code of `200 OK` status means that your request was successful whereas Code `404 NOT FOUND` status means that the resource we are looking for was not found.


```python
response = requests.head('https://www.example.com')

#response is the object here.

response.status_code
```
We can base our actions based on the returned value. 200 OK and 404 NOT FOUND are not the only Status Codes, there is a whole list of them, this is a discussion for some other day.

#### Content

The response.content attribute in the requests library represents the raw binary content of the server's response. It returns the content in bytes. 

Let us understand this better by looking at this example:
```python
response = requests.get('https://api.github.com')
response.content
> b'{"current_user_url":"https://api.github.com/user",......,"user_search_url":"https://api.github.com/search/users?q={query}{&page,per_page,sort,order}"}'
```

We can convert this to string by specifying .text :
```python
response = requests.get('https://api.github.com')
response.text
```

You can find out what encoding requests is using, and change it, using the `r.encoding` property :
```python
response.encoding
> 'utf-8'
response.encoding = 'ISO-8859-1'
```

Similarly there’s also a builtin JSON decoder, in case you’re dealing with JSON data:
```python
response.json()
```

#### Headers

Headers are metadata associated with the server's response to the request. They provide additional information about the server's handling of the request, the content being sent, and other details. Common headers include Content-Type, Content-Length, Date, Server, Set-Cookie, Cache-Control, Location.

Below is a example of how it the response looks like :
```python
response.headers
> {'Server': 'GitHub.com', 'Date': 'Mon, 10 Dec 2018 17:49:54 GMT', 'Content-Type': 'application/json; charset=utf-8', 'Transfer-Encoding': 'chunked', 'Status': '200 OK', 'X-RateLimit-Limit': '60', 'X-RateLimit-Remaining': '59', 'X-RateLimit-Reset': '1544467794', 'Cache-Control': 'public, max-age=60, s-maxage=60', 'Vary': 'Accept', 'ETag': 'W/"7dc470913f1fe9bb6c7355b50a0737bc"', 'X-GitHub-Media-Type': 'github.v3; format=json', 'Access-Control-Expose-Headers': 'ETag, Link, Location, Retry-After, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval, X-GitHub-Media-Type', 'Access-Control-Allow-Origin': '*', 'Strict-Transport-Security': 'max-age=31536000; includeSubdomains; preload', 'X-Frame-Options': 'deny', 'X-Content-Type-Options': 'nosniff', 'X-XSS-Protection': '1; mode=block', 'Referrer-Policy': 'origin-when-cross-origin, strict-origin-when-cross-origin', 'Content-Security-Policy': "default-src 'none'", 'Content-Encoding': 'gzip', 'X-GitHub-Request-Id': 'E439:4581:CF2351:1CA3E06:5C0EA741'}
```
It returns a dictionary-like object, allowing us to access header values by key :
```python
response.headers['Content-Type']
> 'application/json; charset=utf-8'
```

## Perfomance

requests provide feautres like timeout control, sessions, and retry limits to help us keep our application running smoothly.

- #### Timeouts
When making requests to external services, what if the request is never addressed? In such cases it becomes crucial to set a timeout to avoid potential issues like service backlogs, degraded user experiences, or hanging background jobs.
```python
requests.get('https://example.com/', timeout=3.05)
```
```python
requests.get('https://example.com', timeout=(2, 5))
```
The timeout can be passed a tuple like above, here the first element is the time it allows for the client to establish a connection to the server.
The second element is the time it will wait on a response once your client has established a connection.

- #### Max Retries
Suppose a request fails, for some particular reason but you may want your application to retry the same request after some time. We can achieve this in requests by implementing a custom Transport Adapter.
Consider an example where we want all requests to https://api.example.com to retry three times before finally raising a ConnectionError, We would build a Transport Adapter, set its max_retries parameter, and mount it to an existing Session :
  ```python
  import requests
  from requests.adapters import HTTPAdapter
  from requests.exceptions import ConnectionError

  adapter = HTTPAdapter(max_retries=3)

  session = requests.Session()

  # Use `adapter` for all requests to endpoints that start with this URL

  session.mount('https://api.example.com', adapter)

  try:
      session.get('https://api.example.com')
  except ConnectionError as ce:
      print(ce)
      
  ```

## Advanced Application
We have explored various funcationalities of requests that sending data through POST, PUT, and PATCH requests, adapting to different content types. Apart from this requests can be used as Authentication mechanisms, such as Basic and token-based authentication, SSL Certificate verifications, Web Scraping, Data Streaming and much more. 

## Further Reading

- [requests 2.31.0 Pypi](https://pypi.org/project/requests/){:target="_blank"}
- [Requests: HTTP for Humans™](https://requests.readthedocs.io/en/latest/#the-community-guide){:target="_blank"}
- [Python Requests - Quick guide](https://realpython.com/python-requests/){:target="_blank"}

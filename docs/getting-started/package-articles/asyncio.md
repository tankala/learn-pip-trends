---
layout: article
title: asyncio — Asynchronous I/O
description: A comprehensive guide on how to work with asyncio.
tags: 
  - asyncio
  - python library
  - Asynchronous I/O
  - async await
  - tutorial
image: /assets/images/getting-started/asyncio-cover.png
cover: /assets/images/getting-started/asyncio-icon.png
date: 2024-04-01
author: 
   name: Ashok Tankala
   twitter: ashok_tankala
---

![Vehicles stuck at toll gate](https://media.assettype.com/TNIE%2Fimport%2F2021%2F6%2F21%2Foriginal%2Ftoll_plaza_-_EPS.jpg "Synchronous process example")
*Image source: https://www.newindianexpress.com/states/telangana/2021/Jun/21/toll-plaza-collections-drop-due-to-restrictions-2319243.html*

Until the car in front of us goes through the toll gate we don’t get a chance to go through. If that is stuck then we are stuck. Whenever it happens I feel like I wish I had a crane so that I could lift the car and put it in a different lane which is not operating so that the queue progresses.

Have you ever felt like that? I am guessing the answer is yes.

This applies to many queues like queues at grocery stores or apparel stores. All these processes run synchronously.
To tackle this we use threads or processes means building multiple toll gates instead of one so that we can parallelly process.

We all love Python and we know by default our code runs synchronously.

It doesn’t mean synchronous is bad but in some cases it's bad, in some places asynchronous ways make sense.

![McDonald's order taking pic](https://i.pinimg.com/736x/bc/2d/b0/bc2db0ddb76f15a69db11cdb31548f76.jpg "ASynchronous process example")
*Image source: https://www.pinterest.com/pin/the-best-worst-menu-items-at-mcdonalds-according-to-rds--304204149807158254/*

A good example of an asynchronous way is like ordering food at a Fast Food restaurant. You can say ordering burgers at McDonald's.
Here they take orders and give you a number and will say come back when we announce your number and then take the next person's order.
Next person in the queue no need to wait until your order is served to you.

Another example is when you are asking your mom to prepare biryani or pasta.
Then mom will say ok go and play I will make and call you.
Once done she will call you then you will eat your favorite biryani/pasta.

Sorry for giving a lot of food examples. Your mind might have gone to the food world. Let’s come back to our programming world.
A great example is HTTP requests. Let’s say we need to hit 5 APIs.

In the Synchronous world, we will hit one HTTP request and wait once we get back the result we do whatever we want to do and hit the next one.

## Synchronous code example to hit 5 APIs
Below code does the job. Before running it don't forget to install the requests package.

```bash
pip install requests
```

```python
import requests
import time

url_list = [
   "https://backend.piptrends.com//is-package-exists/boto3",
   "https://backend.piptrends.com//is-package-exists/botocore",
   "https://backend.piptrends.com//is-package-exists/urllib3",
   "https://backend.piptrends.com//is-package-exists/requests",
   "https://backend.piptrends.com//is-package-exists/setuptools"
]

start_time = time.time()

for url in url_list:
   try:
       response = requests.get(url)
       if response.status_code == 200:
           print(f"Data from {url}: {response.json()}")
       else:
           print(f"Failed to fetch data from {url}. Status code: {response.status_code}")
   except requests.RequestException as e:
       print(f"Failed to fetch data from {url}: {e}")

end_time = time.time()
elapsed_time = end_time - start_time
print(f"Total time taken: {elapsed_time} seconds")
```

When we run this code we get output like this
```bash
Data from https://backend.piptrends.com//is-package-exists/boto3: {'isPackageExists': True}
Data from https://backend.piptrends.com//is-package-exists/botocore: {'isPackageExists': True}
Data from https://backend.piptrends.com//is-package-exists/urllib3: {'isPackageExists': True}
Data from https://backend.piptrends.com//is-package-exists/requests: {'isPackageExists': True}
Data from https://backend.piptrends.com//is-package-exists/setuptools: {'isPackageExists': True}
Total time taken: 11.119963884353638 seconds
```

This code kind of runs like this
![Synchronous process example](https://files.realpython.com/media/IOBound.4810a888b457.png "Synchronous process example")
*Image source: https://realpython.com/python-concurrency*

We know that after hitting one URL we have no work to do. Our machine's CPU is idle and we just wait and can't do anything else so we need to wait.

## Asynchronous code example to hit 5 APIs

But in the Asynchronous world that's not the case, we will hit one HTTP request and we will say call me back once you get the response and proceed to hit the next HTTP request. Like that, we continue to hit the next APIs. When we get the response for one HTTP request we pick the task where left off for that request and process the next steps.

This code does the job. Before running it don't forget to install the aiohttp package.

```bash
pip install aiohttp
```

```python
import asyncio
import aiohttp
import time

async def fetch_data(session, url):
   async with session.get(url) as response:
       return await response.json()

async def main():
   url_list = [
       "https://backend.piptrends.com//is-package-exists/boto3",
       "https://backend.piptrends.com//is-package-exists/botocore",
       "https://backend.piptrends.com//is-package-exists/urllib3",
       "https://backend.piptrends.com//is-package-exists/requests",
       "https://backend.piptrends.com//is-package-exists/setuptools"
   ]

   start_time = time.time()

   async with aiohttp.ClientSession() as session:
       tasks = [fetch_data(session, url) for url in url_list]
       results = await asyncio.gather(*tasks)

       for url, result in zip(url_list, results):
           print(f"Data from {url}: {result}")

   end_time = time.time()
   elapsed_time = end_time - start_time
   print(f"Total time taken: {elapsed_time} seconds")

if __name__ == "__main__":
   asyncio.run(main())
```

When we run this code we get output like this
```bash
Data from https://backend.piptrends.com//is-package-exists/boto3: {'isPackageExists': True}
Data from https://backend.piptrends.com//is-package-exists/botocore: {'isPackageExists': True}
Data from https://backend.piptrends.com//is-package-exists/urllib3: {'isPackageExists': True}
Data from https://backend.piptrends.com//is-package-exists/requests: {'isPackageExists': True}
Data from https://backend.piptrends.com//is-package-exists/setuptools: {'isPackageExists': True}
Total time taken: 0.8289527893066406 seconds
```

See how fast it does the job. The above code kind of runs like this
![Asynchronous process example](https://files.realpython.com/media/Asyncio.31182d3731cf.png "Asynchronous process example")
*Image source: https://realpython.com/python-concurrency*

By the way, the async, await part is not a new concept. If you are familiar with javascript you might know this concept already. This is in multiple languages.

## 2 Myths I want to bust first.
### Myth1: AsyncIO is a kind of multiprocessing or threads.

I will say no. AsyncIO is a single-threaded, single-process design: it is a cooperative multitasking.
It feels like and looks like parallelism but actually not.

### Myth2: AsyncIO Is Difficult

I will say they are wrong. Many people get used to Threading and multiprocessing, that's why they might be feeling like that if you understand concepts clearly then this code is less messy and less buggy.
I am not saying it's easy, what I am saying is it’s not difficult.

## What is AsyncIO?
It's a module/library of Python programming. In Python, we do asynchronous programming using asyncio.
**AsyncIO at core level is all about managing coroutines.** Before we go deep let’s understand coroutine.

**Coroutines are generators and generators are simpler versions of iterators.**
Let me give you a simple example of a generator and then a coroutine.

A generator function behaves like an iterator. The generator function utilizes a yield statement to return control back to the caller of the generator function.

![How Generator function works?](https://miro.medium.com/v2/format:png/1*iBgdO1ukASeyaLtSv3Jpnw.png "Functions vs Generator")
*Image source: https://betterprogramming.pub/yield-in-python-76413d5e2a27*

Example:
```python
def generator():
  yield "a"
  yield "b"
  yield "c"
```

You can call it like this
```python
for v in generator():
     print(v)
```

Or you can call it like this also
```python
gen = generator()
print(next(gen))  # a
print(next(gen))  # b
print(next(gen))  # c
print(next(gen))  # raises StopIteration
```
You can see that in the for loop code it works like an iterator and in the later case you can see the control the caller has. If the caller calls the next function then only it gives the next value or else it pauses and waits there like a good soldier.

Coroutines are kind of next level to generators. We can only listen to Generators but in Coroutines case we can kind of talk to it. Here the yield keyword accepts the values the caller is giving.

Let’s see an example:
```python
def coroutine():
  msg = "default message"
  while True:
      recieved_message = yield msg
      print(recieved_message + " received")

coro = coroutine()

print(next(coro))  # default message

result = coro.send("message") # message received
print("coroutine returned: " + result) # coroutine returned: default message
coro.send("another message") # another message received

# coro.close() # To close coroutine
```

The next function takes the caller to the yield statement so it returns the message. From there onwards we use the send function to what we want to send to the coroutine. It returns whatever next to yield.

I hope you got the idea about coroutine let's get into the main topic aysncio.

Let’s take a simple function which prints Hello World and let's make the function async.
```python
async def foo():
   print("Hello World")

foo()
```

If you run this code you will get this error. You will get error like this
```bash
RuntimeWarning: coroutine 'foo' was never awaited
  foo()
```

If you see here the moment we add an async keyword to a function python treats it as a coroutine object.
If you are like me you might experiment to put next around the foo function.
```python
next(foo())
```

Then it will clearly say, boss
```bash
TypeError: 'coroutine' object is not an iterator
```

If you try to print the foo function then it will give you a coroutine object reference also. Something like this
```bash
<coroutine object foo at 0x7f6bbdf465e0>
```

To run our foo function we need to use asyncio.run()
```python
import asyncio

async def foo():
   print("Hello World")

asyncio.run(foo())
```

Now you will get our Hello World.

You might get doubts like the initial error said: “never awaited”. Why didn't we use the await keyword?

Because we are getting a coroutine object so to run it we need to use asyncio.run(). asyncio.run basically starts an event loop. The event loop is altogether a big topic. We are not covering here.

If you use the await keyword it will give you an error by saying you can’t use it outside the function. await can be used in the async function only. It is not talking about the await keyword. It's about the async function we called and asycio.run() does the job.

Now let’s write code using async & await both keywords.
```python
import asyncio

async def foo():
   print("foo function Start")
   await some_slow_task()
   print("foo function Finish")

async def some_slow_task():
   print("Slow Function Started")
   await asyncio.sleep(1)
   print("Slow Function Finished")

asyncio.run(foo())
```

Here we are creating some slow process function which takes 1 sec to finish. Instead of time.sleep() we use asyncio.sleep(). In the Async world, we need to deal with things mainly in async ways or else we don’t get the benefit of asynchronous programming.

Here we wait till the sleep is over so that the next work can be done after that. We want to call this a slow process and once that is done we will complete our program.

Now the above code is like our usual synchronous programming only because a task took that much time at that time our CPU was free but our foo function finished waiting for that to be done. Where is the advantage of asyncio? Let me go there.
```python
import asyncio

async def foo():
  print("foo function Start")
  task = asyncio.create_task(some_slow_task())
  print("Another slow task at foo")
  await asyncio.sleep(1.1)
  print("foo function Finish")

async def some_slow_task():
  print("Slow Function Started")
  await asyncio.sleep(1)
  print("Slow Function Finished")

asyncio.run(foo())
```

If you run this program the whole thing is done in around 1.1 secs. But in the synchronization world, it will take 2.1 seconds. That’s the power of async.

Here we start the task which initiates it leave it there and proceed to the next task. Once that initiated task is done then it will come back and let us know it's done.

Let’s say you have a bunch of tasks then how to tackle it. Let me get there.
```python
import asyncio

async def print_at_quarter_sec_speed(count):
   for index in range(count):
       await asyncio.sleep(0.25)
       print(f"Quarter Sec: {index}")

async def print_at_half_sec_speed(count):
   for index in range(count):
       await asyncio.sleep(0.5)
       print(f"Half Sec: {index}")

async def main():
   quarter_sec_task = asyncio.create_task(print_at_quarter_sec_speed(5))
   half_sec_task = asyncio.create_task(print_at_half_sec_speed(5))
   await quarter_sec_task
   await half_sec_task

if __name__ == "__main__":
   import time
   start_time = time.time()
   asyncio.run(main())
   end_time = time.time()
   elapsed_time = end_time - start_time
   print(f"Total time taken: {elapsed_time} seconds")
```

If you run this you can see that for the quarter sec function, it takes a total time of 1.25 secs and for the half sec function, it takes a total time of 2.5 secs. In the synchronous world, it is going to take 3.75 secs but in the asynchronous world, it takes 2.5 secs.

Because first, it will run the quarter sec function it will run and knows that it needs to wait for 0.25 secs so it is free to go to the half sec function and run it. Now it knows I need to wait for 0.5 seconds so once a quarter sec function says I am done with it, it runs that and then goes to sleep that way back and forth things will be done.

2 things I want to cover.
1. If you don’t await a task then it doesn't care about it and stops the program. For example here the half sec function takes time. So if we don’t await for it. Then it runs the quarter sec function and exits the program.
2. You don’t create tasks like this each time then you can use async.gather(). The code will look like below.

```python
async def main():
   await asyncio.gather(print_at_quarter_sec_speed(5), print_at_half_sec_speed(5))
```

Cool right. If you go back to the code I showed at starting for HTTP requests you will get a better sense of the whole thing now.

Note: If you have a rate limit issue for that you need to asyncio.Semaphore(). With that, we can put limits to it.
```python
import asyncio
import aiohttp
import time

async def fetch_data(semaphore, session, url):
   async with semaphore, session.get(url) as response:
       return await response.json()

async def main():
  url_list = [
      "https://backend.piptrends.com//is-package-exists/boto3",
      "https://backend.piptrends.com//is-package-exists/botocore",
      "https://backend.piptrends.com//is-package-exists/urllib3",
      "https://backend.piptrends.com//is-package-exists/requests",
      "https://backend.piptrends.com//is-package-exists/setuptools"
  ]

  start_time = time.time()

  async with aiohttp.ClientSession() as session:
      semaphore = asyncio.Semaphore(2)
      tasks = [fetch_data(semaphore, session, url) for url in url_list]
      results = await asyncio.gather(*tasks)

      for url, result in zip(url_list, results):
          print(f"Data from {url}: {result}")

  end_time = time.time()
  elapsed_time = end_time - start_time
  print(f"Total time taken: {elapsed_time} seconds")

if __name__ == "__main__":
  asyncio.run(main())
```

I hope you got a basic idea about asyncio.

# Ref links:
https://blog.devgenius.io/mastering-asynchronous-programming-in-python-a-comprehensive-guide-ef1e8e5b35db

https://medium.com/@tushar_aggarwal/master-the-power-of-asyncio-a-step-by-step-guide-ac0c46719811

https://www.youtube.com/watch?v=t5Bo1Je9EmE

https://www.integralist.co.uk/posts/python-generators

https://realpython.com/async-io-python/

https://www.geeksforgeeks.org/asyncio-in-python/

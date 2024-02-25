---
layout: article
title: pthon-hunter
description: "Python Hunter Library"
tags: [python, hunter, tracing, debugging, logging, inspection]
date: 2023-02-23
cover: /assets/images/related-articles/general.png
---

Python Hunter Library

<details>
<summary>Why not Smiley?</summary>
There is some clear overlap with smiley, but there are a few essential differences

- Complexity. Smiley is just over-engineered. It utilizes IPC and a SQL database.
It has a web server. A lot of dependencies. It uses threads. Side effects and subtle errors are introduced into your code. It records everything. Attempts to dump any variable. Frequently fails and stops working.

- Tracing long-running code. This will cause Smiley to capture a lot of data, rendering it unusable. Smiley appears to be useful only in one situation, remote tracing of iOS-bound programs. Those programs do not run much code; instead, they just wait on the network, ensuring that Smiley's storage does not exceed its capacity and that tracing overhead is manageable.

- Use-cases. Smiley appears to serve as a "non interactive monitoring" tool rather than a code debugger.

In contrast, Hunter is very simple

- Few dependencies.

- Low overhead (tracing/filtering code has an optional Cython extension).

- No storage. This simplifies lots of things.

- The only cost is that you might need to run the code multiple times to get the filtering/actions right. This means Hunter is not really suited for “post-mortem” debugging. If you can’t reproduce the problem anymore then Hunter won’t be of much help.
</details>

<details>
<summary>Why not pytrace?</summary>
Pytrace is another tracing tool. It appears to be quite similar to Smiley in that it uses a sqlite database for events, threads, and IPC, therefore it is reasonable to expect the same types of issues.
</details>

<details>
<summary>Why not PySnooper or snoop?</summary>
Snoop is a revised version of PySnooper. Both are better suited to tracing tiny programs or functions because the output is more verbose, but Hunter provides more customizable configuration, filtering features, speed, and brevity.
</details>

<details>
<summary>Why not coverage?</summary>
Coverage is a great tool for debugging, but only for "debugging by looking at what code is (not) run". Checking branch coverage is useful, but it only gets you so far.
</details>

<details>
    <summary>Projects using Hunter</summary>
    Noteworthy usages or Hunter (submit a PR with your project if you built a tool that relies on hunter)

    - Crunch-io/diagnose - a runtime instrumentation library.
    - talwrii/huntrace - an alternative cli (similar to ltrace).
    - anki-code/xunter - a profiling tool made specifically for the xonsh shell.
</details>

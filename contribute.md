---
layout: article
title: Contribute an article
description: Contribute an article to learn-piptrends.com
keywords: python, guidelines, pipTrends, contributions
image: https://learn.piptrends.com/assets/images/general/contribute-cover.png
---

Thank you for your interest in contributing an article to learn-pip-trends! We welcome well-written and insightful articles that cover topics related to the latest trends and updates in the world of Python packaging and distribution using pip.

Before submitting your article, we kindly ask you to read and follow our [contributing guidelines](./contributing) to ensure a smooth and efficient review process.

- <a href="https://github.com/tankala/learn-pip-trends/fork" target="_blank">Fork this repository</a>
- Create a new branch: `git checkout -b your-branch-name`
- Add yourself as an author in ```_data\authors.yml``` in the following format:
```yml
shortname:
  picture: # replace with avatar 
  name: # full name
  twitter: # twitter handle
```
- Create an article `(.md)` and store it in the respective folder following the article structure, including the following front matter:
```markdown
---
layout: article
title: <Replace with your article title>
description: <Replace with your article description>
keywords: <Replace with your article keywords(for SEO)>
tags: <Replace with your article tags here>
permalink: <Replace with a permalink based on the section you want to contribute an article to>
key: <Replace with your article key here>
image: <Optional - Replace with image path>
cover: <Optional - Replace with cover path>
aside:
    toc: true
article_header: <Optional - Modify content as per requirement>
    type: overlay
    theme: dark
    background_color: '#ffffff'
    background_image:
        gradient: 'linear-gradient(135deg, #ffffff, #000000)'
        src: <image path>
date: <Repalce with date of publication>
comments: true
author : <Replace with author shortname added in _data\authors.yml>
---
```
- Commit your changes: git commit -m "Brief description of your changes"
- Push your branch: git push origin your-branch-name
- Create a pull request.


**Please ensure that the front matter is included as specified above when contributing an article. You can refer to previous articles and their respective front matter for examples. Thank you for your contributions!**

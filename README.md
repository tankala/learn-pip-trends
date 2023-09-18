# Learn Pip Trends
Learn everything about Python

To run -

```bash
git clone https://github.com/tankala/learn-pip-trends.git
bundle instal
bundle exec jekyll serve
```

To contribute -

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
tags: <Replace with your article tags here>
image: <Optional - Replace with image path, this path has to be a complete url>
cover: <Optional - Replace with cover path, this path can be relative>
article_header: <Optional - Modify content as per requirement>
    type: overlay
    theme: dark
    background_image:
        gradient: 'linear-gradient(135deg, #ffffff, #000000)'
        src: <image path>
date: <Repalce with date of publication>
author : <Replace with author shortname added in _data\authors.yml>
---
```
- Commit your changes: git commit -m "Brief description of your changes"
- Push your branch: git push origin your-branch-name
- Create a pull request.


**Please ensure that the front matter is included as specified above when contributing an article. You can refer to previous articles and their respective front matter for examples. Thank you for your contributions!**

---
title: Contribute 
---

# Contribute to learn.piptrends.com

Thank you for considering contributing to Learn-Pip-Trends! This is a fantastic opportunity to make your first open-source contribution. We welcome well-crafted articles discussing the latest trends and updates in the Python ecosystem, as well as updates to existing articles.

Before submitting your contribution, we kindly ask you to read and follow our [contributing guidelines](./guidelines) to ensure a smooth and efficient review process.

To contribute by submitting an article to learn-piptrends.com, please follow these steps:

- [Fork this repository](https://github.com/tankala/learn-pip-trends/fork){:target="_blank"}
- Create a new branch: `git checkout -b your-branch-name`
- Create an article `(.md)` and store it in the respective folder(```docs\getting-started\package-articles``` for articles about python packages, ```docs\getting-started\package-comparison``` for articles about package comparisons,```docs\getting-started\python-basics``` for articles related to python concepts, ```docs\cheatsheets\``` for python cheatsheets ) following the article structure, including the following front matter:

```markdown
---
layout: article
title: Add article title here
description: Add article description here
tags: 
  - Add
  - list
  - of
  - tags 
  - here
image: Add relative url to the article preview image here
cover: Add relative url to the article icon here
date: Add add publishing date here
author: 
   name: Add author name here
   twitter: Add author twitter here (optional)
---
```

  Please visit [this link](./images) for detailed guidance on the various types of images used with an article and instructions on their creation. 
  
  Example front matter - 

```markdown
---
layout: article
title: Django vs FastAPI vs Flask
description: A comprehensive guide on choosing the right python web framework
tags: 
  - flask
  - django
  - fastapi
  - comparison 
  - web framework
image: /assets/images/getting-started/package-comparison-django-fastapi-flask.png
cover: /assets/images/getting-started/django-fastapi-flask-icon.png
date: 2024-07-29
author: 
   name: Ayush Jain
   twitter: ayushganna
---
```

- Commit your changes: ```git commit -m "Brief description of your changes"```
- Push your branch: ```git push origin your-branch-name```
- Submit a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)

**Please ensure that the front matter is included as specified above when contributing an article. Also do not make any other changes to any other file. The home page will be auto-updated after you submit your article. You can refer to previous articles and their respective front matter for examples. Thank you for your contributions!**

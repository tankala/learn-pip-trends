---
layout: article
title: Add an Article to learn-piptrends.com
description: Make your first open-source contribution with learn.piptrends.com. Contribute by submitting articles, adding related articles or answering FAQs.
cover: /assets/images/contribute/article.png
image: https://learn.piptrends.com/assets/images/general/contribute-cover.png
---

To contribute by submitting an article to learn-piptrends.com, please follow these steps:

- [Fork this repository](https://github.com/tankala/learn-pip-trends/fork){:target="_blank"}
- Create a new branch: `git checkout -b your-branch-name`
- Create an article `(.md)` and store it in the respective folder(```_gettingstarted``` for getting started articles, ```_samplecode``` for sample codes) following the article structure, including the following front matter:
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
date: <Replace with date of publication>
author: 
    picture: <Optional - Replace with author avatar>
    name: <Replace with author name>
    twitter: <Replace with author twitter handle>
---
```
  Please visit [this link](../images) for detailed guidance on the various types of images used with an article and instructions on their creation. 
  
  Example front matter - 
  ```markdown
  ---
layout: article
title: Python-docx
description: A comprehensive guide on how to work with Python-docx, a Python library for creating and updating Microsoft Word files.
tags: [python-docx, python library, Microsoft Word, documents, tutorial]
image: https://learn.piptrends.com/assets/images/getting-started/getting-started-python-docs-cover.png
cover: /assets/images/getting-started/Python-docx-Icon.png
article_header:
    type: overlay
    theme: dark
    background_image:
      gradient: 'linear-gradient(135deg, #90FFDC, #008DF4)'
date: 2023-08-02
author: 
    picture: /assets/avatars/ayush.png
    name: Ayush Jain
    twitter: AyushGanna
---
  ```
- Commit your changes: ```git commit -m "Brief description of your changes"```
- Push your branch: ```git push origin your-branch-name```
- Submit a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)

**Please ensure that the front matter is included as specified above when contributing an article. You can refer to previous articles and their respective front matter for examples. Thank you for your contributions!**

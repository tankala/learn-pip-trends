---
layout: article
title: Add Package Related Articles to learn-piptrends.com
description: Make your first open-source contribution with learn.piptrends.com. Contribute by submitting articles, adding related articles or answering FAQs.
cover: /assets/images/contribute/related-articles.png
image: https://learn.piptrends.com/assets/images/general/contribute-cover.png
---

To contribute by adding external package specific articles to learn-piptrends.com, please follow these steps:

- [Fork this repository](https://github.com/tankala/learn-pip-trends/fork){:target="_blank"}
- Create a new branch: `git checkout -b your-branch-name`
- Locate if the package markdown file already exists under the `_relatedarticles` directory. If not then create one under the `_relatedarticles` directory with the title `package_name.md` and add the below front matter to the file.
```markdown
---
layout: article
title: <Replace with package name>
description: <Replace with your package description>
tags: <Replace with package related tags>
date: <Replace with date of creation/modification>
cover: <Optional - Replace with the path to the cover image, this path can be relative>
---
```
  Please visit [this link](../images.) for detailed guidance on the various types of images used with an article and instructions on their creation. 
  
  Example front matter - 
  ```markdown
---
layout: article
title: absl-py
description: "Abseil Python Common Libraries, see https://github.com/abseil/abseil-py."
tags: [python, absl-py, pypi absl-py, pypi, references]
date: 2023-12-27
cover: /assets/images/related-articles/general.png
---
  ```
- Add related articles using the below syntax to include the link preview for the article. 
  {% raw %}```html
  {% include link-preview.html url = "related-article-link" %}
  ```{% endraw %}

- Commit your changes: ```git commit -m "Brief description of your changes"```
- Push your branch: ```git push origin your-branch-name```
- Submit a [pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)

**Please ensure that the front matter is included as specified above when making a contribution. You can refer to previous articles and their respective front matter for examples. Thank you for your contributions!**

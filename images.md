---
layout: article
title: Article Image Guide
description: Detailed guidance on the various types of images used with an article and instructions on their creation. 
image: https://learn.piptrends.com/assets/images/general/contribute-cover.png
---
There are three main images that you'll need to create for an article. The front matter for these is -
```markdown
---
image: <Optional - Replace with image path, this path has to be a complete url>
cover: <Optional - Replace with cover path, this path can be relative>
article_header: <Optional - Modify content as per requirement>
    background_image:
        gradient: 'linear-gradient(135deg, #ffffff, #000000)'
        src: <image path>
---
```
The key tags are ```image```, ```cover``` and ```background_image``` under ``article_header```.
Each tag serves a different purpose. 
- ```image``` - This tag represents the preview image that will be visible when the article is shared on social media. Here's an example of this image. This image is solely for preview purposes and isn't part of the article content.

    **Dimensions - 1200x630 px**

     Note: The image path should always be an absolute URL.
<center> <img src = "./assets/images/article-images/preview-image.png" alt = "preview image"> </center>


- ```cover``` - This tag represents the icon image that will be displayed on the homepage along with the article title and description.

    **Dimensions - 800x800 px**

<center> <img src = "./assets/images/article-images/article-cover.png" alt = "article cover image"> </center>

- ```background_image``` -  This tag represents the image appearing as the header background for every article. You can also add a gradient instead of an image(preferred).

    **Dimensions - 2100x1600 px**

<center> <img src = "./assets/images/article-images/article-header.png" alt = "article header image"> </center>

As a standard design practice at [learn.piptrends.com](index.html), the ```image```, and the ```cover``` share the same background gradient as with the ```gradient``` tag under the ```background_image```.


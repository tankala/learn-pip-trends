---
layout: article
title: Installing Packages Using pip
description: A guide on how to install Python packages using pip, the Python package manager.
tags: [python, pip, packages, installation, tutorial]
image: https://learn.piptrends.com/assets/images/getting-started/getting-started-pip-introduction-cover.png
cover: /assets/images/getting-started/pip-Logo.png
article_header:
  type: overlay
  theme: dark
  background_image:
    gradient: 'linear-gradient(135deg, #FFB800, #FF8100)'
date: 2023-08-01
author: 
  name: Ayush Jain
---

## What is a Package?
A package contains all the files you need for a module.
Modules are Python code libraries you can include in your project.


## Installing a package
If you’re using Windows, you’ll be able to install a Python package by opening the Windows Command Prompt, and then typing this command:

```bash 
pip install package_name
```

## Uninstalling a package
To uninstall a package using PIP, simply type the following command in the Command Prompt :

```bash
pip uninstall package_name
```

## Generating a requirements.txt file

```pip freeze``` is used to generate a list of all the installed Python packages and their versions in the current environment which can used when you want to create a ```requirements.txt``` file, which lists all the dependencies of your project, including their specific versions. 

Usage:

```bash
pip freeze > requirements.txt
```


## List Packages

```pip list``` is used to display all packages installed. It does not output the packages in the format required for a requirements.txt file. Instead, it simply displays a more human-readable list of installed packages with their version numbers.

Usage: 
```bash
pip list
```

*Result - 
```bash
Package         Version
-----------------------
camelcase       0.2
mysql-connector 2.1.6
pip             18.1
pymongo         3.6.1
setuptools      39.0.1
```

## pip freeze vs pip list

The main difference between ```pip freeze``` and ```pip list``` is in the output format. ```pip freeze``` outputs the package names and versions in a format that can be directly used to recreate the environment, while ```pip list``` provides a more user-friendly display of installed packages without the version information explicitly formatted for a ```requirements.txt``` file.


<sub><sup>*Result may vary depending on the packages installed on your system.</sup></sub>
---

layout: article
title: Python-docx
description: A comprehensive guide on how to work with Python-docx, a Python library for creating and updating Microsoft Word files.
tags: 
  - python-docx
  - Microsoft Word
  - documents
  - Tutorial
image: /assets/images/getting-started/python-docx-cover.png
cover: /assets/images/getting-started/python-docx-icon.png
date: 2023-08-02
author: 
  name: Ayush Jain
---

## Introduction

Python-docx is a powerful Python library designed to handle Microsoft Word documents with ease. It offers a convenient way to create, edit, and extract information from Word files without the need for Microsoft Office Suite. With Python-docx, you can effortlessly generate new Word documents, make modifications to existing ones, and efficiently extract data like text, tables, and images.

Its simplicity and user-friendly nature make it a perfect choice for anyone looking to perform basic document processing tasks in Python, regardless of their programming expertise. Whether you're a newcomer to Python or an experienced developer, this library simplifies the process of working with Word documents, streamlining your projects and saving valuable time.

Throughout this article, we will delve into the fundamentals of using Python-docx, empowering you with the necessary knowledge to embark on your own projects with confidence. Get ready to unlock the potential of Python-docx and elevate your document processing capabilities to new heights.

## Installing Python-docx

To begin using Python-docx, you must first install the library on your computer. This straightforward process can be accomplished using pip, the Python package manager.

To install Python-docx, simply open your terminal or command prompt and enter the following command:

```bash
pip install python-docx
```
Once the installation process is complete, you'll be all set to harness the capabilities of Python-docx in your projects. So go ahead and execute the command, and let's get started with the exciting world of working with Word documents using Python!

## Creating a Word Document

To begin crafting a fresh Word document using Python-docx, start by importing the library into your Python script. Then, utilize the docx.Document class, which allows you to easily generate a new document.

Here's an illustrative example:


```python
import docx

document = docx.Document()
document.save("new_document.docx")
```


With the above code snippet, a brand new Word document is born, and it is promptly saved under the name "new_document.docx." The document is stored in the same directory where your Python script resides.

Now that your canvas is set, you have the freedom to embellish it by adding text, images, and various other elements to make it visually appealing and informative. In the subsequent sections, we will walk you through the process of adding text and applying formatting to customize your document further. Get ready to unleash the power of Python-docx to create impressive Word documents effortlessly!

## Adding Text
To infuse your Word document with compelling content, you can employ the add_paragraph method of the docx.Document class. This method serves as your gateway to creating and filling new paragraphs with text.

Let's take a look at an example:

```python
import docx

document = docx.Document()

paragraph = document.add_paragraph("This is a sample paragraph.")

document.save("new_document.docx")
```

With the code above, a new paragraph springs to life within the document, gracefully adorned with the text "This is a sample paragraph."

To enrich your document further, you can effortlessly introduce multiple paragraphs by replicating the add_paragraph method. Moreover, if you wish to append text to an existing paragraph, the add_run method of the docx.text.Paragraph class will be your faithful companion.

Let's delve into another example to illustrate this:
```python
import docx

document = docx.Document()

paragraph = document.add_paragraph("This is the first paragraph.")
paragraph.add_run(" This is added text to the first paragraph.")

document.add_paragraph("This is the second paragraph.")

document.save("new_document.docx")
```
In this case, two paragraphs come to life within the document. The first paragraph not only carries its initial content but also graciously accommodates additional text, thanks to the add_run method.

With these powerful tools at your disposal, you can now confidently imbue your Word document with captivating text, expressing your ideas with eloquence and style. Keep exploring the possibilities of Python-docx to take your document creation to new heights!

## Formatting Text

Python-docx provides various options to format text in a Word document, such as applying bold, italics, underlining, changing font size, and modifying color. These formatting options can be easily implemented by adjusting properties on the docx.text.Run object.

Let's explore an example to understand how to format text within a paragraph:

```python
import docx

document = docx.Document()

paragraph = document.add_paragraph("This is a sample paragraph with formatted text.")

run = paragraph.runs[0]

run.bold = True
run.italic = True
run.underline = True
run.font.size = 24
run.font.color.rgb = docx.shared.RGBColor(0x42, 0x24, 0xE9)

document.save("new_document.docx")
```
In the above code, we create a new document and introduce a paragraph with specific text. Then, we format the text by setting properties on the run object. In this case, the text will appear bold, italicized, underlined, and have a font size of 24. Additionally, the text color will be set to a custom RGB color.

For more intricate formatting, you can split the run object into different parts and apply distinct formatting options to each segment:

```python
import docx

document = docx.Document()

paragraph = document.add_paragraph("This is a sample paragraph with formatted text.")

run = paragraph.runs[0]

bold_run = run.bold()
bold_run.text = "bold text, "

italic_run = run.italic()
italic_run.text = "italic text, "

underline_run = run.underline()
underline_run.text = "underlined text, "

font_run = run.font(size=24, color=docx.shared.RGBColor(0x42, 0x24, 0xE9))
font_run.text = "formatted text."

document.save("new_document.docx")
```

In this example, the text in the paragraph is divided into separate runs, allowing for fine-grained control over individual formatting. Each segment is then formatted accordingly, producing a diverse and visually appealing outcome.

Now that you're well-equipped with the knowledge of text formatting, you can confidently create captivating Word documents with Python-docx. Use your newfound skills to craft engaging content and effectively communicate your ideas in style!

## Adding Images

To enhance the visual appeal of your Word document, you can effortlessly incorporate images using Python-docx. With the aid of the add_picture method from the docx.text.Paragraph class, you can seamlessly integrate image files into your document.

Let's explore a couple of examples to demonstrate how to add images:

```python
import docx

document = docx.Document()

paragraph = document.add_paragraph("This is a sample paragraph with an image.")

picture = paragraph.add_picture("image.png")

document.save("new_document.docx")
```

In the above code, we initiate a new paragraph in the document and include descriptive text. Subsequently, we employ the add_picture method to import an image from the file named "image.png". The image is seamlessly embedded within the text, maintaining its position even when you modify the document's layout.

If you desire more control over the image's size and placement, you can easily specify these parameters as well:

```python
import docx

document = docx.Document()

paragraph = document.add_paragraph("This is a sample paragraph with an image.")

picture = paragraph.add_picture("image.png", width=docx.shared.Inches(3), height=docx.shared.Inches(2), left=docx.shared.Inches(0.5))

document.save("new_document.docx")
```

In this case, the code remains quite similar to the previous example, but we now define specific width and height values for the image. Additionally, we designate its position by setting its distance to 0.5 inches to the left of the text.

With the flexibility and simplicity offered by Python-docx, you can seamlessly integrate images into your Word document, enlivening your content and making it more visually engaging. Embrace the potential of images to effectively convey information and create impressive documents effortlessly!

## Adding Tables
To add tables to your Word document using Python-docx, you can leverage the add_table method from the docx.text.Document class. This intuitive method allows you to effortlessly create tables within your document, empowering you to organize and display tabular data with ease.

Let's dive into an example to demonstrate how to add and manipulate tables:
```python
import docx

document = docx.Document()

table = document.add_table(rows=2, cols=2)

table.cell(0, 0).text = "First Cell"
table.cell(0, 1).text = "Second Cell"
table.cell(1, 0).text = "Third Cell"
table.cell(1, 1).text = "Fourth Cell"

document.save("new_document.docx")
```
In the code above, we initiate a new document and incorporate a 2 x 2 table within it. The add_table method accepts the number of rows and columns as arguments, and it conveniently returns a reference to the table object. By accessing the cells of the table using the cell method, we can effortlessly populate them with the desired text data.

Furthermore, you have the flexibility to customize the appearance of the table and its cells to match your preferences:

```python
import docx

document = docx.Document()

table = document.add_table(rows=2, cols=2)

table.cell(0, 0).text = "First Cell"
table.cell(0, 1).text = "Second Cell"
table.cell(1, 0).text = "Third Cell"
table.cell(1, 1).text = "Fourth Cell"

table.columns[0].width = docx.shared.Inches(3)
table.columns[1].width = docx.shared.Inches(4)

table.cell(0, 0).background.color = docx.shared.RGBColor(0x42, 0x24, 0xE9)
table.cell(1, 1).background.color = docx.shared.RGBColor(0x42, 0x24, 0xE9)

table.cell(0, 0).style = "Table Grid"
table.cell(1, 1).style = "Table Grid"

document.save("new_document.docx")
```

In this example, we set the width of the first column to 3 inches and the second column to 4 inches using the table.columns property. Additionally, we apply background colors to specific cells using the background.color property and define a border style for the cells using the style property of the docx.table.TableCell class.

With Python-docx's table manipulation capabilities, you can effortlessly organize and present tabular data in your Word document, making it easier for your readers to interpret and comprehend information effectively. Embrace the power of tables to optimize the structure and presentation of your documents!

## Saving a Document
After you have diligently crafted and formatted your Word document using Python-docx, it's essential to save it to your disk for viewing, editing, and sharing. The saving process can be seamlessly accomplished by utilizing the save method from the docx.Document class.

Let's take a look at an example to understand how to save your document:

```python
import docx

document = docx.Document()

paragraph = document.add_paragraph("This is a sample paragraph.")

document.save("sample_document.docx")
```

In the code above, we embark on creating a new Word document and enrich it with a sample paragraph. Once the content is ready, we invoke the save method to save the document to disk. The method takes one argument, which is the desired file name for your saved document. In this instance, the document will be preserved as "sample_document.docx".

Furthermore, it's important to note that you can save your document multiple times to disk, should you need to make further changes. Each time you save the document, it will overwrite the previous version with the most recent modifications. However, if you wish to retain multiple copies of the document, simply save it under different file names.

## Python-docx Projects
Python-docx can be used for a variety of use cases and projects, making it a versatile tool for working with Microsoft Word documents. Here are some examples of projects and use cases where Python-docx can be applied:

- **Automated Report Generation:** Create a script that generates customized reports with dynamic content, such as data tables, charts, and analysis summaries, and saves them as Word documents. This can be useful for businesses, academics, or any scenario that requires periodic report generation.

- **Resume Builder:** Develop an application that allows users to input their information and automatically generates a well-formatted resume as a Word document. Users can choose from different templates and styles to personalize their resumes.

- **Document Data Extraction:** Build a script that extracts specific data from a large collection of Word documents. For example, you could extract information like dates, names, or specific keywords to analyze trends or patterns.

- **Word Document Conversion:** Create a script to convert Word documents to other formats, such as PDF, HTML, or plain text. This can be useful for archiving, sharing, or publishing documents in different formats.

In this article, we have explored the versatile and user-friendly Python-docx library, which empowers users to interact with Microsoft Word documents effortlessly. From creating new documents and adding text, images, and tables to formatting content and saving the final result, learners have acquired a comprehensive set of skills to tackle a wide range of document processing tasks. By understanding Python-docx's capabilities, learners can now confidently embark on projects such as automated report generation, resume builders, and educational tools, streamlining document management and unleashing the potential of this powerful library. Armed with this newfound knowledge, learners can enhance productivity, save valuable time, and explore exciting opportunities in their document-centric endeavors.

## Useful Links
- [python-docx 0.8.11 documentation](https://python-docx.readthedocs.io/en/latest/){:target="_blank"}
- [PyPi - python-docx](https://pypi.org/project/python-docx/){:target="_blank"}
- [Python - Working with .docx module](https://www.geeksforgeeks.org/python-working-with-docx-module/){:target="_blank"}
- [python-docx GitHub - Create and modify Word documents with Python](https://github.com/python-openxml/python-docx){:target="_blank"}
- [Python In Office - Creating A Word Docx File In Python](https://www.youtube.com/watch?v=7ljbGXSxMw4&ab_channel=PythonInOffice){:target="_blank"}


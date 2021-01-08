# Editing Documentation

## Create a new Article

1. Above the file list, click Create new file.
2. In the file name field, type the name and extension `.rst` for the file.
3. On the Edit new file tab, add content to the file.
4. To review the new content, click Preview.
5. Click Propose file change.

[Read more about create new files here](https://help.github.com/articles/creating-new-files)

## Edit an Article

1. In the upper right corner of the file view, click pencil icon to open the file editor.
2. On the Edit file tab, make any changes you need to the file.
3. Above the new content, click Preview changes.
4. Click Propose file change.

[Read more about edit files here](https://help.github.com/articles/editing-files-in-your-repository/)

## Documentation Syntax

Our documentation is written uses [reStructuredText](http://docutils.sourceforge.net/rst.html) as its markup language.

Here is a [cheatsheet](http://docutils.sourceforge.net/docs/user/rst/cheatsheet.txt) that outlines how to format the text.

## Edit the Document Guides

1. Open the file [docs/source/index.rst](docs/source/index.rst) in Github.
2. On the Edit file tab, make any changes you need to the file.

Under the Guides header, insert the sections and articals you would like to list in the following format:

```
Guides
^^^^^^

.. toctree::
   :caption: Section Title
   :maxdepth: 2

   Article One
   Article Two
   Article Three
```

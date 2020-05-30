# pyHexBattle

## A Toolset for Designing Hex-Based Scenario Maps

### Developed by Derek Hohls (2003-2020)

### Version 1.3 - 30 May 2020

# Foreword

**pyHexBattle** is a updated version of a tool that was originally released in 2003; an era when browsers were more primitive and some of the technologies used here were not as widely known.

The "2020" update was created to:

* Share the code on GitHub to make it more accessible (and expandable, should anyone care to do that)
* Replace XLST-specific tools with Python scripts - Python is now widely used and readily available

Apart from some code-tidying and moving of files into a slightly more structured layout, the tool remains essentially the same as the original one.


# Quick Start

If you are comfortable with Python and command-line tools, then do the following:

1. Download the **pyHexBattle** ZIP file from the **Clone or Download** link on this GitHub page
2. Extract the ZIP file
3. In a terminal, change to the `pyHexBattle` directory
4. Create a scenario visualisation by running `python battlecry.py -f FirstBullRun.xml`

This should create a new file (`FirstBullRun.svg`) in the `BattleCry` subdirectory, and automatically display it in your default browser.


# Overview

**pyHexBattle** is a toolset for helping to design scenarios for simple, hex-based board games such as the ones in Richard Borg's **Command & Colors** series. 

I have created this tool as a small token of my appreciation of these great games, and hopefully to be able to give something useful back to the community of gamers who have 'rallied around' to expand the material available, creating dozens of new scenarios and house rules.  **pyHexBattle** harnesses the power of Python, XML and SVG to enable anyone to quickly and easily create smart-looking maps.


# What is pyHexBattle?

## Summary

Simply put, **pyHexBattle** is a mechanism for game designers to readily create maps (or other output formats) for game scenarios. You will still have to undertake the process of historical research to identify interesting battles and carry out the adaptation to the **Command & Colors** format. Once this has been done, **pyHexBattle** can be used to track the scenario design, and allow changes to easily be made. **pyHexBattle** can also be used to adapt existing scenario designs by storing them in a common format that allows any number of different layout presentations to be generated.

## How it works

**pyHexBattle** is based on XML-technologies. XML provides a very powerful mechanism for managing structured data, and has 'spun off' a whole range of related tools and technologies that can all be used in similar ways. Its core benefit is that it allows data and information to be stored independently of the tools that process and present that data (for more reading on XML, see the [XML Resources](#resources)).

**pyHexBattle** utilises XML as follows:

1.  Each scenario is stored in an XML file (a simple text file that describes the scenario in a structured way)
2.  An XSL file is used to determine **how** that XML file should be converted to its graphic equivalent
3.  A Python program will load the XML file and 'transform' the scenario file according to the 'instructions' in the XSL file
4.  The result of the transform process is a customized display of the scenario information; this can be in SVG (graphical view), HTML (text view), or even a simple text file.

Unless you are an XML designer, or want to create new kinds of map layouts (apart from the one most commonly used), you will only need to work with the XML scenario file (described below) - it is not necessary to understand in detail how and why the rest of the process works... it just does!


# Why use pyHexBattle?

If you have not worked with XML before, you may be thinking that this all sounds complex and messy - and that you are better off just using a graphics package. However, after you try the process once or twice, you will see its simplicity and usefulness. Creating a scenario is quick - open up a blank XML template, fill in the names and locations of troops and terrain, along with the basic battle rules and information, and save. Run the transform process (a one line command!). Voila! A neat, attractive map is now available. It's even easier if you want to make changes (to your scenarios, or someone else's) - just open the scenario file, make the correction (e.g. typos, incorrect locations or missing terrain), rerun the transform, and the map is instantly updated. No messing with cut-and-paste or trying to align small, fiddley graphics 'by hand'.

The core XML scenario files are very small (about 5-10k each), and the resulting SVG map files are about 15-30k each. If these are zipped, they shrink even more! This tiny size (compared to tlage size of typical 'standard' JPEG or GIF graphics map file) makes them very quick to send, store and display on the web.

All scenarios can now be stored in consistent format. This allows them to be readily processed into any number of output layouts, including one as close to the original "look-and-feel" as possible. Hopefully, the ease with which new scenarios can be documented will inspire many others to create and share their work.


# How to Use pyHexBattle

## Platform Requirements

**pyHexBattle** has been developed and tested on a Linux machine. In theory, it should be possible to use it on other operating systems, but I am not able to do such testing. [Feedback](#feedback) on your experience in this regard is welcome!

At a minimum you will need a PC or laptop with:

*   a browser (or other software tool) capable of displaying SVG (e.g. Chrome, Firefox, etc.)
*   a text or HTML editor (usually standard on most personal computers)

**NOTE:** no special graphics editor is required. If you are already familiar with XML, or wish to learn more about it, it is suggested that you use obtain an XML-capable editor (see the [XML Resources](#resources) for some suggestions) for editing the various **pyHexBattle** files.

## Setting Up

### Downloads Required

*   The **pyHexBattle** ZIP file can be downloaded from the link on this GitHub page.
*   Python, if not already installed on your machine, can be obtained from [Python.org](https://www.python.org/downloads/)

## Installation

In summary, you will need to:

1.  Unzip the **pyHexBattle** ZIP file to a directory of your choice
2.  Open a command-line terminal, change to the **pyHexBattle** directory and run the appropriate Python script. Each python script will display a short help section if you use, for example, `python battlecry.py -h`

## Summary of the **pyHexBattle** files

The **pyHexBattle** toolset (that you have downloaded and unzipped), consists of a number of files in different directories.

The top-level directories are for each **pyHexBattle** compatible game. Atr present, these inclide:

* Memoir'44
* BattleCry

Within each of these there are various sub-directories:

* **tiles** contains a set of image files (.png extension) that represent the different types of terrain that can be found on a map
* **pieces** contains a set of image files (.png extension) that represent the game's playing pieces
* **scenarios** contains a number of XML files (.xml extension) which are sample scenarios, as well as a blank template file, which can be copied and used as a basis for scenarios of your creation
*  **styles** contains XSL stylesheet files (.xsl extension) that contain the instructions for processing the scenario files to create different outputs. These described in more detail in the README file for each of the specific games.

## How to Create Alternative Display Formats

It's possible that the map display created by the XSL files provided with **pyHexBattle** will not display your scenario exactly the way you would like. In this case, there are four options available to create a more 'customized' layout, presented roughly in order of increasing complexity:

1.  Modify the terrain and troop image files - perhaps the ones supplied are not to your liking... if you do this, you will need to keep the new files the same dimensions as the others, otherwise the map will not display properly (unless you also alter the XSL file - see below)
2.  Modify the display colors and fonts - you will need to alter the stylesheet section that appears at the top of the XSL file. (**Caution:** SVG is far less 'tolerant' of incorrect formatting in CSS than is the case for HTML - poor syntax may lead to the SVG not being displayed at all!)
3.  Modify the layout portions of the XSL file - to do this, you will obviously require some knowledge of XSL and, quite possibly, SVG; you will then be able to change any aspect of the map appearance. If you believe you have made a substantial improvement to the original, please send through your [feedback](#feedback).
4.  Create your own XSL files for other display formats - for example, another type of map layout altogether, or an HTML-only version.


# Current Limits and Future Enhancements

Known current limits and 'issues' include:

*   The current algorithms used for creating the SVG do not always resolve all the clashes around text overlaps. This can be improved further.
*   At present, some scenarios use additional notation not present in the original games. Not all of these new types of notation are catered for.

<a name="feedback"></a>


# Feedback

As is the case for any other new tool, **pyHexBattle** can always be improved and refined. I would welcome feedback from anyone who uses it, or has suggestions for improving its use. Please email me - gamesbook at gmail dot com - or open an issue here on GitHub.

I would also be interested in collaborating to extend **pyHexBattle** to store information for other hex-based wargames that need to track and display information for multiple scenarios.


# Acknowledgements

**pyHexBattle** would not have been possible - or even necessary! - without the inspiration provided by all the creators of the various scenarios. In addition, the PNG terrain files have not been created from scratch by myself, but represent 'extracted and tidied' images from a number of the existing scenario images, created by various authors.

<a name="resources"></a>


# Dedication

**pyHexBattle** is dedicated to the memory of my father, who passed away in July 2004.


# Resources

## XML Resources

*   [XML in 10 points](http://www.w3.org/XML/1999/XML-in-10-points) is a brief overview of XML from [W3C](http://www.w3.org/)
*   [XML.com](http://www.xml.com) has extensive resources for working with XML
*   [Free XML Tools](http://www.garshol.priv.no/download/xmltools/cat_ix.html) has links to numerous tools and software for working with XML
*   [HTML-Kit](http://www.chami.com/html-kit/) is a great HTML/XML editor, if you are working with Windows (or running WINE under Linux)

## SVG Resources

*   [Adobe](http://www.adobe.com/svg/) provides a free SVG-plugin for your browser, as well as training material and demonstrations
*   [SVG overview](http://tech.irt.org/articles/js209/index.htm) covers the reasons for, and benefits of, using SVG on the web
*   [IBM DeveloperWorks tutorial](https://www6.software.ibm.com/reg/devworks/dw-xsvg-i)
*   [W3C Official SVG Site](http://www.w3.org/Graphics/SVG/) has numerous resources and links


<a name="3minutexml"></a>

# Three Minute Guide to XML

## Overview

XML (Extensible Markup Language) is a system for 'marking up' the content of text or data files, in such a way that both humans and computers can easily make sense of it. The purpose of XML is to allow you to focus on describing what the information **means**, rather than how it **appears** (as is usually the case, say, in a word processor, or regular web page).  It is similar to HTML, used to create web pages, but its more general in nature.

XML is stored in plain text files. An XML Processor can be used to convert the XML into HTML (the language used by web browsers) for display on a web site. XSLT (Extensible StyleSheet Language Transformations) is often used for this conversion process. The same XML could also be converted into other formats, for example PDF (the format used by Adobe Acrobat), RTF (used by many word processors) or even another kind of XML document! The key point is that information is **stored** in a single format (XML), and can then be readily **presented** in a variety of other formats, without altering the source information.

## Notation

The notation used for an XML document is that of 'nested tags'. A **tag** is small bit of information which is NOT displayed, but which can used by any program working with the document.

A tag appears as a piece of text between two angled brackets, such as: `<name>`. Tags usually come in pairs, to indicate the start and end of the text that they are marking, for example: `<tt><name>Derek</name></tt>`. The end tag is shown by the `/`. Some tags are singular and indicated by `<tt><tag/></tt>`. XML tag names are case-sensitive, and cannot contain spaces.

A nested tag is on which appears inside another (much in the same way as folders can be 'inside' each other on a directory). For example:

    <name><first>Joe</first><last>Soap</last></name>

Another, more readable layout of this same information appears below. It makes no difference from an XML "point of view" which you use...

    <name>
        <first>Joe</first>
        <last>Soap</last>
    </name>

It should be noted that each tag **must** be completely enclosed by another. Any text which does not appear inside tags will cause a problem with the document, except for 'white space' (tabs, spaces or blank lines) which is ignored.

## Attributes

Tags can also have additional information associated with them, stored in **attributes**. An attribute is enclosed inside a tag, and consists of a name, followed by an '=', followed by a value, enclosed in "". Different attributes inside the same tag are separated by spaces. For example,

    <name staff_number="123">
        <first>Joe</first>
        <last>Soap</last>
    </name>

The `staff_number` is an attribute of <name> and has a value of '123'. Attributes are useful in providing support information for a tag which, although it might never be displayed, is often used by programs working with the XML document, to aid with identification, selection and formatting.

## Special Characters

The consequence of using XML is that certain characters are 'reserved' for use by XML only, including the <tt><</tt> and the <tt>></tt> and the <tt>&</tt> characters. These characters are represented in XML documents using the notation `&XX;` where 'XX' are code letters, as follows:

*   gt - greater than (>)
*   lt - less than (<)
*   amp - ampersand (&)

## Layout

All XML documents are "declared" by inserting a special `<?xml version="1.0"?>` tag at the very top of the document. This allows other programs to recognize and work with the file on the basis that adheres to the XML conventions.

While there can be a number of tags, nested to any depth, inside in an XML document, there must be only one pair of 'outer' tags, which enclose all the others. This is called the **root** tag. So, an example of a small, but complete, XML document would look like:

    <?xml version="1.0"?>
      <staff>
        <name staff_number="123">
          <first>Joe</first>
          <last>Soap</last>
        </name>
        <name staff_number="321">
          <first>Jane</first>
          <last>Smith</last>
        </name>    
      </staff>

Here, the `<staff>` tag is the 'root' of the document.


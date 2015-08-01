---
date: 2013-07-15
layout: post
slug: html-in-five-minutes
tags:
 - web-development
title: HTML in Five Minutes
---

The next key part in web development is <a href="http://en.wikipedia.org/wiki/HTML">HTML</a>. HTML is markup language that describes to a web browser(Chrome, Firefox, Internet Explorer, etc.) how to construct a document(It's used for more than just this, but this explanation will suffice). There are a couple versions of the HTML standard, just like there were with HTTP. The most recent version is HTML5, which added a lot of <a href="http://en.wikipedia.org/wiki/HTML5#Features">modern features</a> to the specification. Every modern web browser follows W3C Standards(Each one implements things a little bit differently, however), so that an HTML document can be viewed in different web browsers interchangeably. The goal is for the standard to be platform independent. When I say platform here I am referring to both software platforms--Windows, Linux, OSX, etc.--and hardware platforms--computers(x86, x64, etc.), Smartphones/Tablets(ARM, x86, etc.), etc.. Ideally somebody can look at the same webpage on two different types of computers, on two different Operating Systems, and two different web browsers, but still see the same information and get the same or a very similar presentation of it. 


A webpage is a hierarchical arrangement of elements. These elements can be lone tags or a set of opening and closing tags. These tags describe to a browser how information should be displayed(along with CSS) and how it should interact(along with JavaScript). At its most basic level the HTML for a web page looks something like this:


{% highlight html %}
    <html>
    <head>
        <title>The Worst Webpage Ever</title>
    </head>
    <body>
        <h1>The Worst Webpage Ever</h1>
        <p>Welcome to the worst webpage ever!</p>
        <marquee>Internet!!</marquee>
        <img src="http://www.google.com/banner.jpg">
    </body>
    </html>
{% endhighlight %}


Webpages have a fair amount of what's called <i>boilerplate</i>, meaning repetitive setup or minimum requirements necessary to get to get the webpage ready. As you can see above this boilerplate includes an element surrounding all others called html. It also includes a head tag, where the the 'meta' information for a webpage is stored, and the body tag, which contains information that will be displayed in the browser. Like I mentioned above these tags have an opening and a closing. The opening tag is simply the word wrapped in angled brackets(aka greater than and less than symbols) and the closing tag is the same word prefixed with a slash, also wrapped in angled brackets. There are some elements that only have only tag, such as the image tag, <img>. Also note the src within the img tag is called an attribute. It's telling the web browser where the find the image. Attributes can be attached to elements at free will, but the HTML specification only supports certain keyword attributes like 'src', 'href', 'style', and a handful of others. Spacing between tags is irrelevant, but there are a few generally accepted readable styles. For instance the same document shown above is again shown below, spaced differently. Still the same information:


{% highlight html %}
    <html>

        <head>
            <title>The worst webpage ever</title>
        </head>

        <body>
            <h1>The Worst Webpage Ever</h1>
            <p>Welcome to the worst webpage ever!</p>
            <marquee>Internet!!</marquee>
            <img src="http://www.google.com/banner.jpg">
        </body>

    </html>
{% endhighlight %}


Web browsers have a default 'stylesheet' they use to display HTML elements. These styles can be(and are on almost all websites on the internet) overridden to customize colors, spacing, text styling, animations, sounds, etc..


Each element has a different meaning to a web browser. As shown above, the h1 element is a 'first header' element that defaults in most web browsers to a large bolded text with a linebreak at the end of it, and a fair bit of vertical margin. It's commonly used for things like titles and subtitles. The paragraph or p element after the h1 element is smaller text, also with a linebreak at the end of the line. There are <a href="http://en.wikipedia.org/wiki/HEAD_tag#List_of_all_HTML_elements">quite a few</a> HTML elements. To customize how these elements are displayed we can include our own custom stylesheet. These stylesheets are referred to as Cascading Style Sheets or <a href="http://en.wikipedia.org/wiki/Css">CSS</a> for short.


We'll dive into how to make webpages' elements interactive when I touch on JavaScript, styling different elements when I touch on CSS, and then how to make the whole webpage not a pile of static elements once we get to application code.

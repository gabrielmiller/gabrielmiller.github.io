---
date: 2013-07-14
layout: post
slug: http-in-five-minutes
tags:
 - web-development
title: HTTP in Five Minutes
---

This is the first post in an instructional series on Web Technologies. By the end of this series I plan to have covered HTML, CSS, JavaScript, Databases, System Architecture, Design Patterns, Application Coding, Web Security and potentially some other things like Computer Networking. We'll begin with HTTP, a protocol that is crucial to web development. Hypertext Transfer Protocol is a protocol used all over the place on the internet to transfer data. It's how your web browser acquires the data to view most web pages.


It's considered a <a href="http://en.wikipedia.org/wiki/Stateless_protocol">stateless protocol</a>, simply meaning that each request sent through it is independent of every other request. There is no specific connection or memory between one request and any other request. In order to create a 'state' or memory between protocols we'll use <a href="http://en.wikipedia.org/wiki/HTTP_cookie">cookies</a> and <a href="http://en.wikipedia.org/wiki/Session_(computer_science)">sessions</a> among other things, but I'll cover those another time.


A request refers to when a web browser(e.g. Chrome, Firefox, Internet Explorer, etc.) requests a web page(Note: This isn't 100% accurate. Requests are not made <i>only</i> from internet browsers, but for a basic understanding this explanation will suffice). Think of it as though every time you either enter a URL and go to a web page, click on a link to a webpage, etc. you have just sent a request for that webpage. Here's what your request looks like when you type in "www.google.com" and go:


{% highlight html %}
    GET / HTTP/1.1
    Host: www.google.com
{% endhighlight %}


A request is a couple lines of text that describes to a <a href="http://en.wikipedia.org/wiki/Server_(computing)">server</a> what resource(s) you are trying to access. Think of it as though you're going to a library and telling the librarian that you want to access the book stored at the location "slash" under "www.google.com". The above request is going to the "google.com" domain, under the "www" subdomain for a document located at the path "/" and is using HTTP version 1.1.


There are a few different <a href="http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods">methods</a> that are used in the HTTP protocol. In the above request we were using GET. GET simply means we are requesting the information stored at a certain location("GET me that book!"). Another common method is POST, which is used when we want to send some information back to the server. For instance when you fill out a form and submit it on a web page you are typically sending a POST request. The POST request tells the server where to store the information you are sending it. There are a handful of less commonly used methods(roughly descending in order) such as HEAD, PUT, DELETE, TRACE, OPTIONS, and PATCH. For our understanding you won't need to worry about these methods.


The server, if it could be found, will respond with the information, if it could be found(or with an HTTP 404 error if the resource could not be found). In the case of the request we sent above, the response from google will look something <i>like</i> this:


{% highlight html %}
    HTTP/1.1 200 OK
    Date: Sun, 14 Jul 2013 21:14:23 GMT
    Content-Type: text/html
    <html>
    <head>
    <link rel="stylesheet" href="/stylesheet.css">
    <title>Google dot com</title>
    </head>
    <body>
        <form method="GET" action="/q">
            <label>Search: </label>
            <input type="text" placeholder="Type your search here!">
        </form>
    </body>
    </html>
{% endhighlight %}


The server found the resource/document(HTTP Status Code 200) and the it is text/html. Below the header of the response is the document, written in <a href="http://en.wikipedia.org/wiki/HTML">HTML</a>. Assuming you're using a web browser, the webpage shown above will be rendered in your browser. To continue with the library metaphor, this is a librarian handing you the book it found at "slash" under "www.google.com"(Hopefully there aren't too many libraries like this).


If you're using a web browser, the web browser will also make a GET request for the linked stylesheet document, which the HTML document referenced at "/stylesheet.css"(When a path is written like this it is called <i>relative</i>. The <i>absolute</i> path for it would be "http://www.google.com/stylesheet.css", or the Host name concatenated with the relative path. Your browser knows how to find both relative and absolute paths on a domain, but sometimes people abuse/misuse/misunderstand the differences). This document is called a <a href="http://en.wikipedia.org/wiki/Css">Cascading Style Sheet</a> and contains information telling your browser <i>How</i> to render a webpage's appearance. For instance, should the background color on the page be a specific color? Should the text be bold? Should the button look like a poptart? Likewise if there are JavaScript files referenced in the HTML document they will be loaded by your web browser, similar to how the CSS file was loaded.

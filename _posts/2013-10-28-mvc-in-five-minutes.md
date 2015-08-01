---
date: 2013-10-28
layout: post
slug: mvc-in-five-minutes
tags:
 - web-development
title: MVC in Five Minutes
---

I'm going to jump into a higher level topic today: design patterns. In particular I'm going to discuss MVC. In modern web development the <a href="http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller">Model-View-Controller(MVC)</a> pattern is very dominant. It breaks down a web application's code into three distinctive groups, models, views, and controllers, hence its eponymous name. There are some minor variations on MVC(as well as further evolutions of it), but I'm going to talk strictly about vanilla MVC.


When your HTTP GET request first arrives at a website(after passing through any intermediate networking devices-load balancers, etc.) the application running on the HTTP server needs to know how to respond. In the early days of web development when most of the web was static content, the HTTP server would simply send a response with the requested document, if it could be found. This mindset was something like a library--Computer, find me a document in this location of the library. In modern applications there is a lot of dynamic content. By this I mean when you load a specific page there is content on the page that may change depending on variables such as when you loaded the page, who you are logged into the application as, what information you've entered into forms, among other variables. For instance if you load a forum discussion thread you may see different responses depending on when you load it. More likely than not it runs on some sort of database to store conversations and users. Every time that page is requested the application looks up the most recent data from the database and returns that in its response. Similarly if you search on Google, the text you type is compared to an index and the corresponding webpages are presented to you. They're programmatically generated and the application looks them up on every request you send(barring a caching mechanism--which a website as high volume as Google is sure to use--so this might not be the best example).


MVC is a separation of logic, data, and presentation. When your GET request arrives at an HTTP server running an MVC application, the application likely will follow a path of logic like this:


 * Initialize the application, instantiate any classes that may be necessary to get the application running
 * Locate the proper controller function(This might be via a routing file, url-to-filepath mapping, or some other scheme)
 * Run the code in the corresponding controller function(s)
 * Execute any model functions to interact with stored data or abstracted functions
 * Look up the correct view if one is necessary for that page
 * Pass data into the view from controller or return the data directly to the response

<b>Controllers</b> are where the logic for each url is stored. For instance if you have a website meant to look up books you might use the MVC pattern to build it. Let's say you want to look up the author or synopsis of a book. You might provide a link to '/books/harry-potter' that may correspond to a controller function named 'books()' and 'harry-potter' may be passed in as a parameter. Next, information about Harry Potter might need to be looked up for the page. When accessing data from a database you typically will use a <b>model</b> function. In this case it might be named get_books(). Depending on variations between frameworks you might call the model functions from within your view or you might pass the data that was looked up in the model function into the view via the model function or the controller. In any case, the data about Harry Potter will be loaded from the database by the model function and the <b>view</b> will be generated with that data in its HTML(important note: not all urls correspond to HTML webpages; some are non-HTML files). That HTML page is sent as the response to the original request.                                                                                                                                                       


Why go through all this trouble when building a webpage? Well it's not necessary, but if you want a <i>maintainable</i> project it is an advisable design pattern to follow. It's a clean distinction of interaction and allows for scaleable back-end development. The most important part of deciding on a pattern is that you are consistent in where you put certain types of logic. For instance, if you can separate logic from display, your code will be much cleaner. Another important point is that if you follow a pattern like this you will know where specific types of logic will always go. To tweak the language on a certain page(if its part of the view) you simply will have to edit the view file. If the language is on a certain page and is loaded from the database then you'll need to edit the text in the database.

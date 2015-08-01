---
date: 2012-05-15
layout: post
slug: adventures-in-google-app-engine
tags:
 - web-development
 - python
title: Adventures in Google App Engine
---

I've been working my way through the Web Application Engineering course offered at <a href="http://www.udacity.com">http://www.udacity.com</a>.This past weekend I went through unit 3 and had my first taste of Google App Engine. I didn't think it would be as rewarding as it was. I highly recommend this online course! By the end of the lesson I had churned out a silly website: <a href="http://gm-img.appspot.com">http://gm-img.appspot.com</a>. It's a simple image and text sharing board. Users enter their names, some optional text, and select an image to share.


There are some rough edges to my site—I have at least two problems that I would like to fix. First I need to confirm what's being posted is actually an image, and second I need to resize large images to the maximum width of the page, around 930 pixels wide after padding and margins are added. Perhaps I'll make the images thumbnails and still link to the full-size images.


In any case, I was surprised how intuitive the whole experience was. It reminded me a lot of creating sites with Django. First a url comes in and you set up the context with which you wish to respond. It felt much more free than Django, but also more rudimentary. The Udacity course focused on using forms and interpreting posts versus gets. Their lesson stepped through the logic of posting, interpreting, and responding to HTML forms and the ideas behind validation. By the end of the unit the students created an ascii art board, sort of like a shoutwall. I decided I wanted to throw in image postings. With a little bit of research and fidgeting about I was able to come up with my little application.


Whee!

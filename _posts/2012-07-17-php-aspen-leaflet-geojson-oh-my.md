---
date: 2012-07-17
layout: post
slug: php-aspen-leaflet-geojson-oh-my
tags:
 - web-development
 - python
 - php
 - javascript
title: Php, Aspen, Leaflet & GeoJSON, Oh my!
---

It's been a while since I've written an entry as I've been busy spelunking deep in the depths of the internet. First off, I brought a close to my first two larger PHP projects. Both of them use a MySQL database, so I think for my next database project I'll try to throw in PostgreSQL. I have a couple ideas floating around but what will rise to the top of the glass next has yet to be seen. I've been reading about all of the following:


 * PostgreSQL, PostGIS, Mapserver, Geoserver
 * <a href="http://aspen.io">Aspen</a>, a unique web framework written in large part by a guy I met at PghPy
 * CakePHP
 * <a href="http://leaflet.cloudmade.com/">Leaflet</a>
 * JSON, GeoJSON


I hadn't given much thought to web based mapping tools until recently. Being used to desktop GIS(I use ESRI software every day at work... *barf*) capabilities and then looking at web tools at first makes the web tools available appear inadequate. But I began to realize how valuable online mapping actually is. Especially when tied to data presentation, mapping is really an incredibly valuable way to pull together data.


Finally, a bit unrelated, I've been playing around with a framework called <a href="http://aspen.io">Aspen</a>. It's based on Python and takes a couple cues from MVC frameworks and combines them with a traditional filesystem structure, so in a way it throws out the C of MVC. Each page resides in a www/ directory much like traditional PHP on apache. There are three “pages” to each file. For instance you could have an index.html in www/. In that file you can write python logic. The first two “pages” contain imports and logic respectively and the last "page" contains HTML and can be templated with Python. Each “page” is divided by linebreaks, “^L”. Fun! 


At first that might sound dreadful—mixing logic and presentation in one file. But really what it does it take the filesystem you know and love and uses it. You don't need to configure urls that match to regular expressions. There are a number of other interesting bits, and honestly there is probably a whole lot I haven't even discovered yet, but I whole-heartedly recommend you take a look at Aspen. It might just convince you to drop Chad Whitacre a <a href="http://www.gittip.com">tip</a>.

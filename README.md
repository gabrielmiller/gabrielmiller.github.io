# Blog

Bliggity blaggity bloggity blog

## Why?

This blog will be easier to maintain(than my previous, django based blog) as it is purely static files. Further, there are also fewer dependencies. Also, it's something new for me.

## Instructions

### Compiling

First install ruby. I am developing against 2.1.0p0, but older versions should be fine. Next install jekyll and compile the website.

    cd jekyll
    gem install jekyll
    jekyll build

To watch files, build when they are edited, and run an internal HTTP server for developing, use the following parameters: 

    jekyll serve --watch


### Sass

Make sure you have ruby installed. You'll also need to install compass:

    gem install compass

For development you can run the following flags on compass to watch for file changes and recompile css when changes are made: 

    compass watch -c scss/config.rb


### Deploying

This section has yet to be written

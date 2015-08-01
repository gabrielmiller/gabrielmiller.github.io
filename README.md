# Blog

Bliggity blaggity bloggity blog

## Why?

This blog will be easier to maintain(than my previous, django based blog) as it is purely static files. Further, there are also fewer dependencies. Also, it's something new for me.

## Instructions

### Installation

    git clone git@github.com:gabrielmiller/gabrielmiller.github.io.git
    cd gabrielmiller.github.io
    rvm install 2.1.1
    rvm —default use 2.1.1
    gem install bundler
    bundle install


#### Sass

Make sure you have ruby installed. You'll also need to install compass:

    gem install compass

For development you can run the following flags on compass to watch for file changes and recompile css when changes are made: 

    compass watch -c scss/config.rb

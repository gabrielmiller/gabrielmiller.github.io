## Instructions

### Installation

    git clone git@github.com:gabrielmiller/gabrielmiller.github.io.git
    cd gabrielmiller.github.io
    rvm install 2.7.0
    rvm —default use 2.7.0
    gem install bundler
    bundle install

### Run locally

    bundle exec jekyll serve

#### Sass

For development you can run the following flags on compass to watch for file changes and recompile css when changes are made: 

    compass watch -c scss/config.rb

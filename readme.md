# Refinery CMS Banners

Simple banners engine for [Refinery CMS](http://refinerycms.com).

This version of `refinerycms-banners` supports Rails 3.0.x.

## Requirements

Refinery CMS version 1.0.0 or above.

## Install

Open up your ``Gemfile`` and add at the bottom this line:

    gem 'refinerycms-banners', '1.0', :git => 'git://github.com/julesce/refinerycms-banners.git'

Now, run ``bundle install``

Next, run:

    rails generate refinerycms_banners

Finally migrate your database and you're done.

    rake db:migrate

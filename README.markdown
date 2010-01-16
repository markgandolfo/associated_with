Associated With
============

In most of my rails applications I need to check if a certain object is associated with another object.
I usually do this the long way, so I finally decided to create a plugin for a project I'm working on called [Scrum&Cola](http://scrumandcola.com)

Example
=======

Ok, first you'll need ActiveRecord classes, with associations. 

    class Post < ActiveRecord::Base
      belongs_to :author
    end
 
    class Author < ActiveRecord::Base
       has_many :posts
    end

Next find a post, and an author.

    post = Post.find(1)
    author = Author.find(1)

Now lets see if they're associated. 

    post.associated_with? author

or I can do it the other way around

    author.associated_with? post


This will return a true or false!

Tests
=====

To run the tests, create a database `associated_with_test` and simply just into the plugin's directory and type `rake`


TODO
====

I still have to write tests for polymorphic relationships, but i've "tested" manually and it works fine.. expect them up soon. 
    

Copyright (c) 2010 Mark Gandolfo, released under the MIT license

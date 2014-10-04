---
layout: post
title: "The Painful Steps to Amazing 'AHA!' Moments"
date: 2014-03-06
tags:
---

I have mentioned the intensely sought after "AHA!" moment a few times before. Let me take a few moments to try and explain what that means for the unfamiliar.  

>##sought
>###sôt
>####1. past and past participle of seek.
attempt or desire to obtain or achieve (something).
"the new regime sought his extradition"
synonyms:	try to obtain, work toward, be intent on, aim at/for 

This "AHA!" moment that we all are seeking is the fuel for our fire. So far, my experience with Ruby and now Ruby on ~~Rails~~ Sinatra has been filled with these moments. No more powerful of an "AHA!" moment has been achieved than the one I obtained today when working with ActiveRecord. The developers out there reading this (and I include my fellow classmates in that classification) that are familiar with ActiveRecord know exactly what I am driving at. For the uninitiated, here is my 30 second elevator pitch for ActiveRecord:
> **ActiveRecord** lets you interact with all different kinds of databases without having to write and express all different kinds of Data-oriented language code (e.g. SQL) inside your eloquent Ruby. So, something like this in Ruby with SQL: `galleries = database.exec_params("SELECT * FROM galleries;")` can be expressed in Ruby as: `gallery = Gallery.all` when using ActiveRecord.

ActiveRecord does so much more that the above and I am looking forward to using it more and more. This is not something that we arrive at on a nice smooth road either, and it brings me to the title of this post. There were lots of painful steps that had to be taken for us to fully appreciate everything that ActiveRecord is doing in the background. Just like anything else in life, your appreciation for it grows exponentially once you learn more about its inner workings and the behind the scenes legwork it takes to get it done.

Both [Goose](http://twitter.com/halogenandtoast) and [Steiner](http://twitter.com/josh_steiner) (our instructors for the [Metis](http://thisismetis.com) bootcamp) have talked about the need for going through these, sometimes, painful exercises. To write beautiful, eloquent, Ruby using all the great tools that are available to us, *and* understand it, you've really got to write code that uses the lower level technologies first. 

If I just thought syntax like `Gallery.all` and `image = Image.new` was using black magic I would never be able to intelligently discuss my code and explain to someone what it does. That is a skill that is very important to me. 

So, for anyone who is thinking of learning a new programming language, or any  new skill: when you get up to that first wall you think is too high to climb over, keep at it, and pretty soon one of those "AHA!" moments is going to give you the boost you need to hop right over.

Or, for another wall metaphor from [Steiner](http://twitter.com/josh_steiner):
>Don't worry if you hit a wall, pretty soon we are going to be running so fast we'll run right through it.

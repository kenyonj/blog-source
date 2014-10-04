---
layout: post
title: "Teaching is the best method of learning."
date: 2014-02-25
tags:
---


Day 2 of the [Metis](http://thisismetis) bootcamp has come and gone and today most of us got our first taste of the ruby language. I have dabbled in it before using different online tutorials, such as [Codecademy](http://www.codecademy.com). I have never really taken a problem, spoke about and solved it in everyday english, and then used that to write my code. It is a great way to really drive home those basic concepts that will help build the foundation of what we will be learning over the next 12 weeks.

Wow, 12 weeks. That seems like so far away. Especially since only after day 2 we have broken a lot of the first week ice that is now allowing us to lean on each other and really collaborate to solve problems. This is a huge concept in Rails: **teamwork**. I see it everywhere. From meetups and online boards, to resume skills and job postings. I am very glad that this environment that [thoughtbot](http://thoughtbot.com) is fostering is encouraging teamwork so heavily. 

I realized over the last 2 days that the best way for me to commit something to memory is to teach it to someone else. Much like creating a unique memory in your mind when trying to learn someones name. If a unique event happens when you learn someone's name, you are more likely to remember it. The same is true when learning new skills. You can see someone do it, even do it yourself, but you really lay the cement when you explain it to someone else.

So, in observance of my new found skill, let me teach you how to write your first Ruby program, a simple lottery program:

We'll run this in the Interactive Ruby Shell, so open Terminal (on a Mac, for Windows, you'll have to [download](http://rubyinstaller.org/) and install Ruby first, then open a command prompt) and type:
`irb` and press `ENTER`

You should now see a prompt that looks similar to this:
`irb(main):001:0>`

We are going to start by writing a function. This will allow us to write out all the code, but not execute any of it until we call the function at the end. A function is basically a recipe that you will lookup and use when you need it, but it is stored until such a time.

After each line of code you will press `ENTER`

First, we will define the function:
`def lottery`

Next, we will we use the `puts` method to literally "put" something on the screen for the user to see:
`puts "Give me some names, then enter a blank line when you are finished."`

This will be followed by our initialization of the variable we will use to store all the names for the lottery. Since it will store multiple names we need to put it inside an array variable. To initialize an array variable all you need to do is assign an empty array to your variable name by typing this:
`names = []`

Now, we need to prompt the user to start entering names. First we will want to show a little prompt symbol, just so it's clear where they will be typing:
`print "> "`

You may have thought, "Why didn't we use the `puts` method?". Well, `puts` will display the message to the user and append a carriage return, or new line, at the end of the message. The `print` method displays just what's inside the quotes and does not automatically append any carriage returns. In this case, we just wanted to show the prompt and allow the user to start typing on the same line.

Next, we need to tell the program where to store the input from the user. In this case, the initialization and method that takes the input from the keyboard is all going to be accomplished in one line:
`name = gets.strip`

So far we have used `puts`, `print`, and `gets`. Are you starting to get the idea that Ruby is very easily readable by humans? One more thing about the above line I would like to explain because we are going to see it again in a few lines. The `strip` method, when applied to an object, is going to remove any leading and trailing whitespace. This means that if the user enters `SPACE` `SPACE` `SPACE` `SPACE` `Kevin` `SPACE` `SPACE` `SPACE`, all the program is going to assign to the `name` variable is `"Kevin"`. This will allow us to avoid any issues that we might have with blank entries as well.

We now have 1 name in a `name` variable, but we have to get as many names as the user wants to enter and store it in the `names` array we created earlier. To accomplish this we will use a loop. Loops in Ruby are also very easy to read and write. Here is the loop we will use:
`while name != "" do`

Basically this loop is going to loop through everything following it until the name that the user enters is blank, or `""`. You'll see later on that we will need to close the loop so that the loop knows where to turn back and start from the beginning.

Since we already have the first name from the user that we collected before the loop started, we need to assign that to the array. The placement of this command will also be useful for when the loop repeats to complete the same task each time:
`names << name`

You see that we are adding `name` to the array `names` by putting `<<` in between. Think of the less-than signs as directional markers and they are adding the value on the right to the collection on the left.

Next, we want to prompt the user for another name. We will use the same work as before:
`print "> "`  
`name = gets.strip`

This brings us to the end of our loop and we need to loop back around so that these entries get recorded, or, if the user entered a blank line, the loop will stop since the loop definition part is no longer true. For us to signal the end of the loop, we need to type:
`end`

We now want to pick a winner at random and display the result. Guess what? It's super easy to do all that in Ruby, and can be accomplished in only 1 line! Here it is:
`puts "The lottery winner is #{names.sample}!"`

Again, we used the familiar `puts` method to display things on the screen. Then, we notified the program that we are going to throw a variable inside of the string by typing in a `#{variable}`, and since we wanted to pick a random entry, all we needed to do was run the `sample` method on the array that we wanted to pick from. This returns 1 entry in the names array and displays it.

Now, we can end the function that we just wrote by typing:
`end`

You should now see the shell display the function you just wrote like this: 
`=> :lottery`

Now, all we need to do is execute the function and test the lottery. To run the function, type:
`lottery`

Good luck! Once you are done playing around in the Interactive Ruby Shell you can type either `quit`, `exit`, or press `CTRL+D` to get back to your main terminal prompt. I have listed all the irb commands and my test with the lottery game below for your reference. 

My main reason for doing this is exactly what I said before, the best way you can fully learn and understand something is to explain it to someone else. I am now a pro at Ruby lottery games that are under 15 lines long!

	irb(main):001:0> def lottery  
	irb(main):002:1> puts "Give me some names, then enter a blank line when you are finished."
	irb(main):003:1> names = []
	irb(main):004:1> print "> "
	irb(main):005:1> name = gets.strip
	irb(main):006:1> while name != "" do
	irb(main):007:2* names << name
	irb(main):008:2> print "> "
	irb(main):009:2> name = gets.strip
	irb(main):010:2> end
	irb(main):011:1> puts "The lottery winner is #{names.sample}!"
	irb(main):012:1> end
	=> :lottery  
	irb(main):013:0> lottery
	Give me some names, then enter a blank line when you are finished.
	> Justin  
	> Nastya  
	> Sophia  
	> Tanya  
	> Natalya  
	> Vladimir  
	> Kyle  
	> Krista  
	> Paula  
	> Chuck  
	> Dima  
	> Arseniy  
	>  
	The lottery winner is Dima!
	=> nil  
	irb(main):014:0>





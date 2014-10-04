---
layout: post
title: "What a difference a couple days (and some new skills) makes!"
date: 2014-03-03
tags:
---

You may remember that just this last Saturday I wrote a [blog post](http://reallybusywizards.com/one-week-in-as-motivated-as-ever/) centered around sharing my progress publicly when coding. That day, I felt pretty accomplished because I succeeded in writing a hangman program. However, it really didn't feel "right" since the code was ugly and really wasn't as readable as a program written in Ruby should be. So, today I totally rewrote it with another member of my [Metis](http://thisismetis.com) cohort. During this exercise I had so many "Aha!" moments that I really feel I have reached a huge milestone in my understanding of Object-oriented programming. One of our instructors, Goose, described that icky feeling you get when writing code that works, but is just not as clean as you want it to be. That perfectly described how I felt about my last commit to my hangman.rb file on Saturday. Everything worked, the game could be played, but it was just plain... ugly! By writing code using OOP it really helps you step back and tackle one issue at a time and allows for complete readability.

This is, again, further than I have reached in any other programming language and my code is looking clean. *And*... I actually understand everything I am doing, which is a huge accomplishment in my mind.

You can check out my new hangman game here: [Github: hangman_oop.rb](https://github.com/kenyonj/metis-week02/blob/master/day01/hangman_oop.rb)

Or, just check out this code:

	class Hangman
 	 MAX_GUESSES = 6
  	attr_reader :word, :guesses

  	def initialize(word)
    	@word = word
    	@guesses = []
  	end

 	 def play
   	 display_welcome_message

    	until game_over?
     	 display_status
   	   ask_for_letter
    	end
	
    	display_result
	  end

	  private

	  def display_result
    	if winner?
	      puts "You win!"
    	else
	      puts "You lose! The word was #{word.join}."
    	end
	  end

	  def ask_for_letter
    	print "> "
	    guesses << gets.strip.downcase
    	guesses.uniq!
	  end

	  def game_over?
    	winner? || loser?
  	end

	  def winner?
    	(word - guesses).empty?
	  end

	  def loser?
    	guesses_remaining == 0
	  end

	  def display_status
    	display_turns_remaining
	    display_guesses
    	display_board
	  end

	  def display_guesses
    	puts guesses.sort.join(" ")
	  end

	  def display_turns_remaining
    	puts "#{guesses_remaining} guesses remaining"
	  end

	  def display_board
    	word.each do |letter|
	      if guesses.include? letter
    	    print "#{letter} "
	      else
    	    print "_ "
	      end
    	end
	    puts
	  end

	  def guesses_remaining
    	MAX_GUESSES - incorrect_guesses
	  end

	  def incorrect_guesses
    	(guesses - word).length
	  end

	  def display_welcome_message
    	puts "Welcome to Hangman!"
	  end
	end

	dictionary = []

	file = File.open("/usr/share/dict/words", "r")
	dictionary = file.to_a
	word = dictionary.sample.strip.split("")

	game = Hangman.new(word)
	game.play
   
   
As fun as this command line Ruby stuff is, I am really looking forward to getting into Ruby on Rails soon!   

---
layout: post
title: "Custom media keys for custom keyboards"
date: 2014-11-21
tags: "spotify, poker ii, mechanical keyboards, media keys"
categories: blog
---


Since diving into the mechanical keyboard world I have been loving the feeling
of accomplishment I get working with tools that provide the physical feedback I
am looking for. I am able to get into a rhythm of sorts when coding and really
stay in the zone.

My favorite keyboard so far has been the [KBC Poker II](http://deskthority.net/wiki/KBC_Poker_II).
This has been the keyboard that I keep returning to on a daily basis. It is a
small keyboard. In the mechanical keyboard world it is one of the most popular
60% keyboards on the market. However, the one big downside for me has been the
lack of media keys. There is a full layer of programmable function keys on the
Poker II, but nothing that will emulate the native PAUSE/PLAY, NEXT, and
PREVIOUS keys on the standard Mac keyboard (F8, F9, and F7 keys respectively).

For this to be accomplished we have to fall back on to some kind of software
solution. Lots of people like
[Karabiner](https://pqrs.org/osx/karabiner/), which is very powerful and
apparently can allow you to fully customize your keyboard for many different
tasks. I tried Karabiner, but found it a little too complicated for what I
wanted to do and my search continued.

Today, I found a very simple solution. If you open up your System Preferences on
your Mac and navigate to Keyboard, and then click on the Shortcuts tab:

![sys_prefs_keyboard_shortcuts](http://i.imgur.com/i3Dy1g8.png)

We are now going to create one (or three) of these services to be able to
control Spotify from the keyboard using the keyboard shortcut of our choosing.

First, open Automator (`/Applications/Automator.app`). Start a new document and
select "Service" as the type of document you wish to write.

![automator_doc_selection](http://i.imgur.com/SdC5fA2.png)

You will now be presented with a new default workflow that you will customize
for our first goal: Creating a system wide `PLAY/PAUSE` shortcut for Spotify.

Choose "no input" from the "Service receives selected" drop down.

![automator_service_selected](http://i.imgur.com/CCKZnhT.png)

Type `run` in the search box, and drag `Run AppleScript` over to the editing
section.

![automator_apple_script](http://i.imgur.com/bmNJ5qM.gif)

Now, replace `(* Your script goes here *)` with one of the following (depending
on which service you are trying to create:

- `tell application "Spotify" to previous track`
- `tell application "Spotify" to next track`
- `tell application "Spotify" to playpause`

Save the file with something like `Spotify PlayPause`. This will be the name
that shows up in the Keyboard/Shortcuts meny.

Once you have saved the new service, open up System Preferences, click on
Keyboard and then click on the Shortcuts tab.

In the "Services" section, on the bottom you should see your new custom
services:

![new_services](http://i.imgur.com/MJaA45H.png)

All you need to do now is hover over the `none` text on the right of your
service and it should change to a `add shortcut` button. Click this and you can
use the keystroke that you wish to attach to this service. Make sure that you
use something that is not used by other applications. Some testing may be
necessary.

Note: once you created this new shortcut, access it first by selecting the
service from the menu bar. It will not be available to your keyboard before you
do this once.

![service_menu](http://i.imgur.com/8T5OyY5.png)

I hope you found this as helpful and as easy as I did.

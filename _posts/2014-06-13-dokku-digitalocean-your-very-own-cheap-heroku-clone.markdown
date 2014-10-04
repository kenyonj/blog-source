---
layout: post
title: "Dokku + DigitalOcean = Your very own, cheap, Heroku clone!"
date: 2014-06-13 14:40:41
---

These days I am learning tons of new information on a daily basis. I am currently a developer apprentice with [thoughtbot](http://thoughtbot.com) and one of the benefits of working with such a smart and motivated group of people is that I am constantly pushed to continue learning and developing my own skills.

One hurdle that I am about to gracefully jump over is setting up my own "heroku-like" clone using [Dokku](https://github.com/progrium/dokku) and [DigitalOcean](http://digitalocean.com). I am paying around $5 a month and I am able to push any web app up to my personal server and Dokku will build it and deploy it onto a custom subdomain of my choosing.

I tried looking for a definitive guide of how to do this and ended up in lots of different places on the web to finally get all the information I needed to complete the process. The goal of this post is to help others that are trying to do the same thing. Here is the compilation of steps that I went through to get it up and running for deploying Rails apps:

(disclaimer: these are OS X Mavericks specific directions. If you are on another system, YMMV.)

- Sign up for an account at [DigitalOcean](https://www.digitalocean.com/?refcode=a0f9fff0e285). (note: this is a referral link, I get credit for referring you to DigitalOcean... Thanks!)
You can use a coupon code for $10 to be added to your account (which is basically 2 months free) by searching google for: `DigitalOcean Promo Code`. Once you have this code, you can add it to your account on the billing page:
  - Click on Billing
  - Click on Manage Payments
  - Add the promo code on the bottom of this page

- Create an ssh key for your system to share with DigitalOcean for authentication:
  - Open terminal:
    - Type these commands (pressing enter after each `command`):
      - `ssh-keygen -t rsa`
      - Press `enter` to save it in the default location: `~/.ssh/id_rsa`
      - Press `enter` to leave the password blank. note: if you want to be super secure, enter a password here and you will be asked for that password whenever authenticating using this key.
      - `cat ~/.ssh/id_rsa.pub`
      - Copy the output to your clipboard and continue to the next set of steps

- On DigitalOcean, click on SSH Keys, then Add SSH Key:
  - In the top field, give this key a name. This is not significant, just a way to differentiate between SSH Keys.
  - Paste what you copied from the output of `cat ~/.ssh/id_rsa.pub` in the bottom field.
  - Click on CREATE SSH KEY

![ssh_key](http://i.imgur.com/YXw5C5R.png)
#### Note
The above key is totally random and not my real SSH Key. On that note, you should never publish your key since it gives you full root access to the system we are going to build.

---

#### Create your droplet
- Click on `Create` to start the creation of a new droplet:

![create_droplet](http://i.imgur.com/IfYgu56.png)

-  Use the screen caps below to guide you through the droplet creation. Underneath the following pictures I will give you notes on some of the fields.

![droplet_1](http://i.imgur.com/3Xa0Zy8.png)
![droplet_2](http://i.imgur.com/QHhy4Yk.png)
![droplet_3](http://i.imgur.com/OcEWZmr.png)

#### Notes:
- For the hostname field: You will add in your domain name here. This does not have to be registered yet, but you should think about registering something to be able to really customize your deployments. Here you can have the domain `appsinspace.com`. This allows you to deploy apps that are accessible through: `http://app-name.appsinspace.com`, just like Heroku!
- For the size, you can choose the cheapest option (selected in the screen capture). If you wish to deploy more than 2-3 apps on this server you might run into memory issues (heap size errors during the build process) and need to bump this up to the 1GB of memory option (I have already done this on my droplet).
- Select the region that is closest to you or the users that are going to be accessing your apps.
- For the Select Image section, you will select the "Applications" tab and then "Dokku v0.2.3 on Ubuntu 14.04" (as of this post this is the latest DigitalOcean image, if it changes this guide might be broken.)
- In the Add optional SSH Keys section, click on the SSH key that you added to DigitalOcean earlier.
- Leave the Settings section untouched and click on Create Droplet

---
- Once your droplet has been created, you will be directed to a page like the one below:
![droplet_settings](http://i.imgur.com/0dXrrqm.png)

- Copy down the IP address from this screen. I will here on refer to that address  as: `<IP-ADDRESS>`

- Navigate to `http://<IP-ADDRESS>` and you should see a screen similar to below:
![dokku_setup](http://i.imgur.com/8oR3yiu.png)

#### Notes:
- Paste your SSH Key that you created on DigitalOcean into this top box.
- In the Hostname field, you can leave it as an IP address, or change it to your custom domain name that you have registered.
- The option right below the Hostname field can be checked if you wish to use app URLs like `thisismyapp.appsinspace.com`, otherwise you can just leave it unchecked and apps will be deployed in the format displayed in the last text field.
- Once you have the options set up, click on "Finish Setup"

---
- Now that you have the dokku side all finished, there are some maintenance tasks that need to take place on the server that, if not completed, will cause some apps to fail at deployment.
- Open terminal
- Type these commands (pressing enter after each `command`):
  - `ssh root@<IP-ADDRESS>`
    - these steps will update the dokku deploy step:
      - `cd ~/dokku`
      - `git pull origin master`
      - `make install`
    - these steps will install the dokku postgresql plugin:
      - `cd /var/lib/dokku/plugins`
      - `git clone https://github.com/Kloadut/dokku-pg-plugin postgresql`
      - `dokku plugins-install`
    - these steps will fix the LANG env variable for the docker containers (currently unecessary for rails deployments, but I am currently working on Haskell deployments and this is an issue):
      - `docker run progrium/buildstep locale-gen en_US.UTF-8`
      - `docker ps -l` - note the ID of the command you just ran
      - `docker commit <ID FROM PREVIOUS STEP> progrium/buildstep`

#### Now you are ready to deploy an app!
- Clone this small heroku sample rails app and deploy it using these steps:

  - `git clone git@github.com:heroku/ruby-rails-sample.git`
  - `cd ruby-rails-sample`
  - `bundle`
  - `bundle exec rake bootstrap`
  - `git remote add dokku dokku@<IP-ADDRESS>:rails-sample`
  - `git push dokku master`
  - You will now see a bunch of deploy buildsteps, similar to what you see when deploying to heroku.
  - Once this is complete, you will still not be able to view your app since we have to create the database on the server side, even though this is completed automatically when using Heroku (small price to pay for your own deployment system).

- Log into your server, create the database, and rake db:migrate by following these steps:
  - `ssh root@<IP-ADDRESS>`
  - `dokku postgresql:create rails-sample`
  - `docker run -i -t dokku/rails-sample /bin/bash`
  - `export HOME=/app`
  - `for file in /app/.profile.d/*; do source $file; done`
  - `hash -r`
  - `cd /app`
  - `RAILS_ENV=production rake db:migrate`
  - `exit`
  - `exit` - not a duplication error, this will log you our of your ssh session.
  - Note: this is quite the process. Hopefully in the future I can wrap this all up in a script that can be run after deployment to make it even more like Heroku.

###Done!
Now you can navigate to your new web app url, either: `http://rails-sample.appsinspace.com`, or something similar, or `http://<IP-ADDRESS>:<SPECIFIC-PORT>` (these details can be found at the bottom of the push messages from earlier, in this format:

![deployed_at](http://i.imgur.com/loKHLrc.png)

I hope that this guide was informative and helpful. It may even save you some money while giving you a dev playground on the cheap.

Thanks for reading!

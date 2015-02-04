soyoustart-crawler
==================

Adapted from @Simnol
--------------------
I've adapted @Simnol's script to do pushbullet notifications, easy and elegant way to get notifications on all your devices without using mail

What is it?:
------------

This is a quick and gritty script that I threw together because I was bored of missing out on the new servers at SoYouStart. I am aware that it is terrible, but it works.

Prerequisites:
--------------

The first prerequisite is that you read the script and understand what it does.

The second is ensuring the place you're running the script from can email out.

After that some basic things should be installed:

bash
curl
grep

You will also need a Pushbullet api token which you can get from the Pushbullet website for free.

Installation:
-------------

To run the script, you simply need to download the file, or copy and paste it, into a new location, and chmod it. I used one of my servers for monitoring since I could be assured that it wouldn't be offline.

After you have made the file executable, it would be a good idea to set up a cronjob to check the site.

SoYouStart servers sell extremely quickly, so you will want to set the timer to something like the following:

<code> */5 * * * * root /home/adam/soyoustart-crawler.bash </code>

In the script currently it monitors three different servers: E3-SSD-1, E3-SSD-2, E3-SSD-3. This can be changed to monitor whichever SoYouStart server you wish, but you sill need to find the system codename (e.g. 143sys10 is E3-SSD-2) which can be obtained by wget'ing the entire page http://www.soyoustart.com/en/essential-servers/ and locating the system you are after, the codename is sprinkled around the code.

You then need to change the line in the script similar to the following:

<code> curl -silent https://eu.soyoustart.com/en/cgi-bin/newOrder/order.cgi?hard=143sys10 > /tmp/143sys10 && </code>

This basically get's the 'order form' page of the server you're interested in. When the server is not available this prints an error page, including "Le paramètre est invalide".

Update any mention of the codename you desire in the script, and change the line "mail -s E3-SSD-1 <Your Email>" to your email address. You may have to allow email from your server if it gets marked as spam.

Contact:
--------

If you'd like to get in touch, feel free to send me a message.

Contribution:
-------------

I can't imagine this is relevent, but contributions are welcome.

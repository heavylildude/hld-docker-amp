# HLD Docker AMP Stack 🤘⚡
Welcome to the most gnarly, no-fuss, drop-in-and-slay local dev environment on the block. This is a full-power Apache, MySQL, and PHP stack, all neatly packed into Docker containers. It's like a portable dev server that follows you around, ready to rip whenever you are. No more installing a million things on your machine that go rogue later. Just pure, containerized bliss. ✨

This rig is built to be a true "it just works" setup for any PHP project. Just drop your code in and go!

## What's In The Box? 📦 (The Tech Stack)  
Think of this like your ultimate custom skate deck, built with only the sickest parts:  
The Deck (Web Server): Apache 2.4, fully loaded.  
The Trucks (Backend Language): PHP 8.2, with all the essential modules ready to shred (mysqli, pdo, gd, zip, intl, and more).  
The Wheels (Database): MySQL 8.0, rollin' smooth and fast.  
The Bearings (DB Management): phpMyAdmin, because who has time to type SQL commands all day? 💅  

## Key Features 🔑
✅ Full Local HTTPS: Rock that https:// lock icon on localhost from day one.  
✅ Total .htaccess Freedom: We enabled a2enmod rewrite, so all your fancy URL rewriting rules will work perfectly.  
✅ Fully Loaded PHP: No more missing extension errors. We packed in the good stuff.  
✅ Drop-and-Go: Chuck any PHP project into the folder and it's instantly live.  
✅ Persistent DB: Your database data is stored in a Docker volume, so it's safe even when you shut down the containers.

## Requirements 🛠️  
All you need is one thing, brah. No excuses.  
Docker Desktop installed on your machine.  

## File Structure 🗺️
Once you're set up, your crib should look like this. The certs folder will be made by you!  

```
/hld-docker-amp
├── certs/
│   ├── localhost.crt
│   └── localhost.key
├── .env
├── .env.template
├── apache.conf
├── docker-compose.yml
├── Dockerfile
├── index.php
├── openssl.cnf
├── session_test_1.php
└── session_test_2.php
```

## Quick Start Guide (Bugger-Friendly Edition) 🤙  
Follow these steps and you'll be slayin' code in minutes. Let's get this bread! 🍞  

#### Step 1: Forge Your Fake ID 💳 (SSL Certs)  
To get that sweet https:// vibe on localhost, you need a fake ID card, a.k.a. a self-signed SSL certificate.

Inside the main project folder, create a new, empty folder named certs.

Fire up your terminal (Git Bash on Windows is a solid choice) and run this one command. It uses the included openssl.cnf to forge a pro-level fake ID for your server.

```
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout certs/localhost.key -out certs/localhost.crt -config openssl.cnf
```

This will pop two files, localhost.key and localhost.crt, into your certs folder. Done. ✅

#### Step 2: Spill The Tea ☕ (Configure Environment)
This is where you tell the containers your secret passwords. It's like the secret handshake to get into the treehouse.

Find the file named .env.template.

Rename it to .env.

Open the new .env file and swap out the placeholder text with your own bloody awesome passwords.

Step 3: Fire Up The Engines! 🚀
This is the moment of truth. In your terminal, from the main project folder, smash this command:

```
docker-compose up -d --build
```

This tells Docker to read all the config files, build your custom webserver hot-rod from scratch, and spin up all the containers in the background. It might take a minute the first time, so go grab a coffee. ☕

#### Vibe Check Your Setup ✅
Once the command finishes, your new dev rig is live!  

**Your Projects:** Access all your PHP files at https://localhost:8888.  

Heads Up! Your browser will throw a security fit the first time you visit. This is normal! It's because you're the one who signed your "fake ID," not a big fancy corporation. Just click "Advanced" and then "Proceed to localhost (unsafe)".  

**Database Management:** Access phpMyAdmin at http://localhost:8081.  

#### I've already dropped in three files for you to test everything:  

index.php: A simple "Hello World" to make sure PHP is running.  
session_test_1.php & session_test_2.php: Use these to confirm that PHP sessions are working perfectly between page loads. Just go to the first one and click the link.  

And that's it! You're ready to build something gnarly. Go get 'em, tiger. ✨

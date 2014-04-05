---
layout: post
title: Anonymous database data retrieval
slug: anonymous-database-data-retrieval
date: 2012-02-06
---


While pondering anonymity(quite the hot topic on the internet these days) I began to think how one could design database-client interactions so as to make it so that a database does not know what data the client is inspecting. At first it sounds illogical--how could one anonymously access data?--but really there is at least one reasonable way I envision.


Typically a client would enter data, it would be encrypted client-side(let's hope!) and then sent to the database. Let's say you're logging into a website via a login system. You enter your username and password, the password is encrypted, sent to the server's database, and compared to the hash matching your username in the database. If the two hashes match, you're allowed to enter. If they don't, you're sent a message about entering the wrong password and to try again.


Let's make some assumptions for our problem. You have a database with millions of encrypted strings. Encryption is performed client-side. It's not a login system, because you don't match a username to a password's hash, but rather just match a hash.


<code>
Entered Text: yourDATA
Md5 Hash: 0e4174f5dd30d3a7c1f070ec8a393b73
</code>


In order to test if "yourDATA" is held within a database, you must confirm that the hash "0e4174f5dd30d3a7c1f070ec8a393b73" is stored in the database(assuming that the encryption has no collisions, which would lead to a false-positive result). The easiest way to maintain anonymity-that is, not let the database know exactly which data you're inspecting-is to have the database return multiple entries. Ideally, if the database could, it would send you every single hash and you would see whether or not the one you're looking for is apparent. But it's unrealistic to have a database send a single client that much data; a more realistic method would be to have your computer whittle down results by asking the database how many results correspond to just tidbits of your hash.


First your computer would ask the database how many hashes begin with "0," and then "0e," and then "0e4," and so on. The number of results would gradually decrease until, if the data is in the database, the result would be 1. If the data is not in the database, the result will be 0. But how would one decide a "safe" tolerance to the number of hashes? If there were just 10 entries for "0e4," who's to say there will be more than 1 entry for "0e41?"


The problem is that as soon as you receive one single key the database can say what data you are accessing. There are some caveats: for instance, if the data was a false positive and really your data isn't in the database. If the design were to send you all of the hashes, however, at a set tolerance, then anonymity could be maintained. For instance, as soon as the database sends you the following:


<b>0e4174f5d</b>24dcc3b5aa765d61d83
<b>0e4174f5d</b>765d61d8327deb882cf99
<b>0e4174f5dd30d3a7c1f070ec8a393b73</b>
<b>0e4174f5d</b>f2ab331b0f975ae943ddc93
(and onward)...


We know our data is in the database. We also know that we didn't blow our cover because there were multiple results.


How do we determine when the database should send a list of hashes to a user before it's too late and cover is blown? It's a tricky situation.


More on this another day.While pondering anonymity(quite the hot topic on the internet these days) I began to think how one could design database-client interactions so as to make it so that a database does not know what data the client is inspecting. At first it sounds illogical--how could one anonymously access data?--but really there is at least one reasonable way I envision.


Typically a client would enter data, it would be encrypted client-side(let's hope!) and then sent to the database. Let's say you're logging into a website via a login system. You enter your username and password, the password is encrypted, sent to the server's database, and compared to the hash matching your username in the database. If the two hashes match, you're allowed to enter. If they don't, you're sent a message about entering the wrong password and to try again.


Let's make some assumptions for our problem. You have a database with millions of encrypted strings. Encryption is performed client-side. It's not a login system, because you don't match a username to a password's hash, but rather just match a hash.


<code>
Entered Text: yourDATA
Md5 Hash: 0e4174f5dd30d3a7c1f070ec8a393b73
</code>


In order to test if "yourDATA" is held within a database, you must confirm that the hash "0e4174f5dd30d3a7c1f070ec8a393b73" is stored in the database(assuming that the encryption has no collisions, which would lead to a false-positive result). The easiest way to maintain anonymity-that is, not let the database know exactly which data you're inspecting-is to have the database return multiple entries. Ideally, if the database could, it would send you every single hash and you would see whether or not the one you're looking for is apparent. But it's unrealistic to have a database send a single client that much data; a more realistic method would be to have your computer whittle down results by asking the database how many results correspond to just tidbits of your hash.


First your computer would ask the database how many hashes begin with "0," and then "0e," and then "0e4," and so on. The number of results would gradually decrease until, if the data is in the database, the result would be 1. If the data is not in the database, the result will be 0. But how would one decide a "safe" tolerance to the number of hashes? If there were just 10 entries for "0e4," who's to say there will be more than 1 entry for "0e41?"


The problem is that as soon as you receive one single key the database can say what data you are accessing. There are some caveats: for instance, if the data was a false positive and really your data isn't in the database. If the design were to send you all of the hashes, however, at a set tolerance, then anonymity could be maintained. For instance, as soon as the database sends you the following:


<b>0e4174f5d</b>24dcc3b5aa765d61d83
<b>0e4174f5d</b>765d61d8327deb882cf99
<b>0e4174f5dd30d3a7c1f070ec8a393b73</b>
<b>0e4174f5d</b>f2ab331b0f975ae943ddc93
(and onward)...


We know our data is in the database. We also know that we didn't blow our cover because there were multiple results.


How do we determine when the database should send a list of hashes to a user before it's too late and cover is blown? It's a tricky situation.


More on this another day.

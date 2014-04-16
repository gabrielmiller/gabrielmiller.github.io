---
layout: post
title: Rotation Encryption
slug: rotation-encryption
date: 2012-01-30
categories:
 - Python
 - Code
---

I came upon the idea of changing viewing angle while pondering something completely unrelated--DNA frameshifts, if I recall. This isn't really encryption, but rather it's interpreting data from a different angle. It's more of an obfuscation. As for real world implication... you'd have to dig into it a little deeper than I have.


The idea is that you enter data and it is broken into 8 character packets, converted to its ascii binary value, and laid into an 8x8 table of 0s and 1s. That table is then interpreted from a different viewing angle, converted back into characters, and regrouped from its 8 character packets. For instance, the string "ThisData" is entered, and a string of a bit of gobbledygook is returned:

<div class="img-wrapper">
    <img src="/img/img1.gif">
</div>


I present to you the first draft code I wrote to create this behavior:


{% highlight python linenos %}
TheData=raw_input("Enter your data > ")
TheData=str(TheData[:])
lendiff=len(TheData)%8
if lendiff>0:
  TheData=TheData+((8-lendiff)*'0')

DataList = list(TheData)
DataListBinary = []
atemp=[]
DataListBinaryOutput = [[],[],[],[],[],[],[],[]]
indexer = [0,0]
for sublst in DataListBinaryOutput:
  sublst=[[],[],[],[],[],[],[],[]]
for a in DataList:
  for b in bin(ord(a)):
    atemp.append(b)
  DataListBinary.append(atemp)
  atemp=[]

for c in DataListBinary:
  offset=c.index('b')
  c[:offset+1]=offset*['0']
  if len(c)<8:
    c=((8-len(c))*['0'])+c
  for d in c:
    DataListBinaryOutput[indexer[1]].insert(indexer[0],d)
    indexer[1]=indexer[1]+1
  indexer[0]=indexer[0]+1
  indexer[1]=0
indexer = [0,0]
joiner=['','','','','','','','']

for e in DataListBinaryOutput:
  for f in e:
    joiner[indexer[0]]=joiner[indexer[0]][:]+f
    indexer[1]=indexer[1]+1
  indexer[1]=0
  indexer[0]=indexer[0]+1
finalResult=''
for g in joiner:
  finalResult=finalResult[:]+chr(int(g, 2))
print finalResult
{% endhighlight %}


It gets the job done, but there are a couple issues that I immediately saw:


 * The code repeats several steps and could be condensed into functions to reduce code size. For instance, to get the original string to an 8 element list of 8 element lists, the data goes through similar processes: being forced into a list of 8 elements. Similarly, when converting back to readable data, the list is converted into strings two separate times. It's likely these processes could each be turned into functions or methods.
 * Only 8 characters can be run through this code at a time. If the original data was broken into instances of a class, each instance of 8 characters could be run through the interpretation simultaneously.
 * It's clunky.


I like how the flow of this works, because it seems to tell the story of many programs:


Something happens, then the program does something important, and then that something un-happens. For instance a file is opened, a change is written, and then file is closed. In this case a process rolls forward so that the main function can happen(breaking the easily readable data into an 8x8 grid), the change happens(data is interpreted from a different view), and then a process rolls backward(the 8x8 grid is returned to easily readable data).


Revisions soon!

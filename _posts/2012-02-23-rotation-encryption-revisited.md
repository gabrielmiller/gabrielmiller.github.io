---
layout: post
title: Rotation Encryption Revisited
slug: rotation-encryption-revisited
date: 2012-02-23
categories:
 - Python
 - Code
---

Here's the first revision to my rotation encryption code from about 2 months ago. As a refresher, the idea is as follows: You enter data and it is broken into 8 character packets. These packets are converted to ascii in a 8x8 table of 1s and 0s. These values are then interpreted 90 degrees from how they were entered, combined, and returned back as text. And the image I drafted to describe the process, again:


<img src="http://www.cheddarcode.com/g/img/img1.gif">


The goals of the revision were to make the code capable of converting more than 8 characters at a time, and making the process more modular. Here it is:


{% highlight python %}

import copy #Import copy because deepcopy is used

class dataChunk():
    def __init__(self, chunk):
        self.chunk = chunk
    def breakToList(self):  #Breaks strings into lists of strings, and lists of strings into lists of lists of strings
        try:
            for num in range(len(self.chunk)):
                self.chunk[num]=list(self.chunk[num])
        except:
            self.chunk=list(self.chunk)
    def stringToBinary(self):       #Converts each character into binary and replaces its "0b" with "00" if applicable
        for num in range(len(self.chunk)):
            self.chunk[num]='0'*(8-ord(self.chunk[num]).bit_length())+bin(ord(self.chunk[num])).lstrip('0b')
    def flipData(self):     #Interprets data from a shifted 90 degree perspective
        self.temp = copy.deepcopy(self.chunk)
        for num in range(len(self.chunk)):
            for innum in range(len(self.chunk[num])):
                self.temp[num][innum]=self.chunk[innum][num]
        self.chunk=self.temp
    def unbreakList(self):  #Joins lists of lists of strings into lists of strings, and lists of strings into strings
        try:
            self.chunk=''.join(self.chunk)
        except:
            for num in range(len(self.chunk)):
                self.chunk[num]=''.join(self.chunk[num])
    def binaryToString(self):       #Converts binary strings into single character strings
        for num in range(len(self.chunk)):
            self.chunk[num]=chr(int(self.chunk[num],2))
    def createOutput(self): #Returns output to the user
        return self.chunk

def main():
    enteredData = raw_input("Enter your data > ")
    modDiff = len(enteredData)%8            #Makes sure our chunks are each 8 characters.
    eData = enteredData[:]                          #If they aren't then the difference in 0s is appended to the string.
    if modDiff>0:
        eData = enteredData[:]+(8-modDiff)*'0' 
    chunkDict = {}
    counter = 0
    while len(eData)>0:                                     #Create a dict of 8 character chunks and instance their values.
        chunkDict[counter]=dataChunk(eData[:8])
        eData = eData[8:]
        counter+=1
    output=''
    for item in chunkDict:                          #For every 8 character chunk, iterate through the methods and concatenate output
        chunkDict[item].breakToList()
        chunkDict[item].stringToBinary()
        chunkDict[item].breakToList()
        chunkDict[item].flipData()
        chunkDict[item].unbreakList()
        chunkDict[item].binaryToString()
        chunkDict[item].unbreakList()
        output=output[:]+chunkDict[item].createOutput()
    print "Your output is '%s'" % output

if __name__ == "__main__":
    main()

{% endhighlight %}


I liked this approach much more than my last approach. Each packet is broken up, instanced, and thrown into a dictionary together. Each value(instance) in the dictionary goes through a series of methods, including breaking the data down, converting it, joining it, and returning it.


In response to my previous critiques:


 * The code is actually longer now. It is, however, much more robust and versatile. Each step of the process is its own method.
 * Text in excess of 8 characters can be run through the program.
 * It feels much cleaner.
 * I changed my tab habits to the pythonic 4-space tab(arguably neither a pro nor a con)


Possible revisions may include:


 * Condensing the breakToList and unbreakList methods down so that try/except logic is unnecessary. The way I am using try/except is almost as though I am type testing.
 * Cutting excess lines out


More another day!

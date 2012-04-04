See: http://www.petri.co.il/forums/showthread.php?t=25204

Recently I had a need to distribute an RDP file to several users that, when they use it, would log them on without prompting for username and password. We all know that it is possible to save an RDP file with the password in it but the problem is when you move it between users or computers the password doesn't work.

Info on why can be found here: http://www.remkoweijnen.nl/blog/2007/10/18/how-rdp-passwords-are-encrypted

The above link also provides code for converting a password string into the encrypted password. After a crash course in VB.NET I was able to write a utility that will hash a password properly for an RDP file.

So with this utility I'm able to dynamically create an RDP file with the password in it and deploy the script to whoever needs it.

Giving credit where it's due. The VB.NET example from here was the base and with a few tweaks from the comments in the first link I was able to get a working utility.

Usage example for the utility: cryptRDP5.exe <password>

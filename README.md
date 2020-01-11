# xpra-standalone
Demo docker of xpra (xpra.org) with browser access

Build the image or run

docker run -d -p 14502:14500 --name xpra-standalone -h xpra-standalone wuebbel/xpra-standalone 
firefox http://localhost:14502/connect.html

The fixed Username/Password is wuebbel/wuebbel.

This is meant as a demo for xpra installation and testing.

**Do no run this in production.**

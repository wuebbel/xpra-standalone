# xpra-standalone
Demo docker of xpra (xpra.org) with browser access

Build the image or run

	docker run -d -p 14502:14500 --name xpra-standalone -h xpra-standalone wuebbel/xpra-standalone 
	firefox http://localhost:14502/connect.html

The fixed Username/Password is wuebbel/wuebbel. After connecting, wait some seconds for the lxterminal to appear.

This is meant as a demo for xpra installation and testing.

To show startup error messages:

	docker logs xpra-standalone

To enter the container:

	docker exec -t -i xpra-standalone /bin/bash --login       

To enable debugging, enter the container and run (e.g.)

	 xpra control :0 debug enable keyboard

and find the logfile in /run/user/1000/xpra/:0.log.

Stop and remove container and docker using

	docker stop xpra-standalone
	docker rm xpra-standalone
	docker rmi wuebbel/xpra-standalone

**Do not run this in production.**

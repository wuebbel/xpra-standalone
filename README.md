# xpra-standalone
## Demo docker of xpra (xpra.org) with browser access

This is meant as a demo for xpra installation and testing. 

To just download the ready-made docker from hub and run it:

	docker run -h xpra-standalone -d --name xpra-standalone -p 14502:14500  wuebbel/xpra-standalone
	firefox localhost:14502


However, I recommend downloading the source and building the docker from source.
./doit serves as interface to controlling the container.

build using

	./doit build

Run the image and start a firefox with desktop access:

	./doit run
	./doit browser

The fixed Username/Password is wuebbel/wuebbel. After connecting, wait some seconds for the lxterminal to appear. Note that German keyboard is pre-selected, and a patch for German keyboards has been applied which makes dead keys work, but may break non-German keyboards.


To show startup error messages:

	./doit logs

To enter the container:

	./doit runin

To enable debugging, enter the container and run (e.g.)

	 xpra control :0 debug enable keyboard

and find the logfile in /run/user/1000/xpra/:0.log.

Stop the container and docker

	./doit stop

Remove the container image

	./doit rmi

**Do not run this in production.**

= The Autotest Notification Gem

* http://www.nomedojogo.com/2008/05/12/autotest-notification-gem/

== DESCRIPTION:

This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results.

== REQUIREMENTS:

* If you're using a Mac:
		You need to have Growl and growlnotify installed on your machine.
		
		Download the Growl [http://growl.info/index.php] and install it like any other application on your Mac
		
		Then you must install the growlnotify.
		
		In your shell, cd to the directory on the Growl disk image containing growlnotify, and type ./install.sh.
		That script will install growlnotify to /usr/local/bin and the manpage to /usr/local/man.

== INSTALL:

	$ sudo gem install carlosbrando-autotest-notification --source=http://gems.github.com
	
Run it to let the notifier in automatic mode:

	$ an-install

To turn off the notifier:
	
	$ an-uninstall

== Contributors

* carlosbrando [http://www.nomedojogo.com/]
* simpsomboy [http://alexandredasilva.wordpress.com/]
* urubatan [http://www.urubatan.info/]
* chjunior [http://tas.milk-it.net/]

== LICENSE:

(The MIT License)

Copyright (c) 2008

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
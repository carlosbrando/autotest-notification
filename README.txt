= The Autotest Notification Gem

* http://github.com/carlosbrando/autotest-notification/

== DESCRIPTION:

This gem set the autotest (ZenTest) to send messages to software as Growl, LibNotify, and Snarl, displaying a window with the results.

== REQUIREMENTS:

* If you're using a Mac:
		You need to have Growl and growlnotify installed on your machine.
		
		Download the Growl [http://growl.info/index.php] and install it like any other application on your Mac
		
		Then you must install the growlnotify.
		
		In your shell, cd to the directory on the Growl disk image containing growlnotify, and type ./install.sh.
		That script will install growlnotify to /usr/local/bin and the manpage to /usr/local/man.
		
* If you're using a Windows:
    You need to have Snarl and sncmd installed on your machine.
    
    Download Snarl [http://www.fullphat.net/] and install it like any other application on your machine.
    
    Then download sncmd [http://www.k23productions.com/download.php?view.105] open the zip file and place the executable from the zip in any directory in windows PATH (for example c:\windows)
    
* If you're using a Linux:
    You need to have libnotify binaries installed.
    
    For ubuntu this means: sudo apt-get install libnotify-bin
    
    Other distributions may package it with other names, do a search for libnotify using your distribution package manager.
    
    If you use KDE and do not have libnotify-bin installed, it will try to use kdialog wich is part of KDE.

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
* daviscabral [http://blog.impactmedia.com.br/]

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
= THE AUTOTEST NOTIFICATION GEM

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

    If you want to be notified with voice of the test results, when running an-install, pass a "-s" switch, when you do not want voices notifications anymore, just run it again without the "-s" switch.

    
* If you're using Windows (with cygwin):
    You need to have Snarl and sncmd installed on your machine.
    
    Download Snarl [http://www.fullphat.net/] and install it like any other application on your machine.
    
    Then download sncmd [http://www.k23productions.com/download.php?view.105] open the zip file and place 
    the executable from the zip in any directory in windows PATH (for example c:\windows).


* If you're using Windows (without cygwin):
    You need to have Snarl, diffutils and ruby-snarl installed on your machine.

    Download Snarl [http://www.fullphat.net/] and install it like any other application on your machine.

    Download DiffUtils for Windows [http://gnuwin32.sourceforge.net/packages/diffutils.htm] and follow the installation instructions on the site.
    
    Run in the command prompt:

			$ gem install ruby-snarl
    
    After all that. You must update the environment variable PATH with the path to the bin of diffutils.
    It's the price that was paid for using Windows (try cygwin).
    
    
* If you're using Linux:
    You need to have libnotify binaries installed.
    
    For ubuntu this means: sudo apt-get install libnotify-bin
    
    Other distributions may package it with other names, do a search for libnotify using your distribution package manager.
    
    If you use KDE and do not have libnotify-bin installed, it will try to use kdialog wich is part of KDE.
    It also works if you have zenity installed.

    If you want to be notified with voice of the test results, instal espeak [http://espeak.sourceforge.net/] too, it is not needed.
    And when running an-install, pass a "-s" switch, when you do not want voices notifications anymore, just run it again without the "-s" switch.

		To hear the sounds of Doom Edition, you need the mplayer [http://www.mplayerhq.hu/design7/dload.html] installed.


== INSTALL:

  $ sudo gem install autotest-notification
  
Run it to let the notifier in automatic mode:

  $ an-install

In Windows without cygwin, it's necessary to install in the directory of the project:
  
  $ an-install --path=C:\projects\my_project

To turn off the notifier:
  
  $ an-uninstall


== Special Doom Edition

	$ an-install --doom --speaking

== Buuf Edition - Display Buuf icons by Mattahan [http://mattahan.deviantart.com]

	$ an-install --buuf

== Showing a yellow warning image when there are no errors/failures but there are pending specs

	$ an-install --pending

== CONTRIBUTORS:

* carlosbrando [http://www.nomedojogo.com]
* simpsomboy [http://alexandredasilva.wordpress.com]
* urubatan [http://www.urubatan.info]
* chjunior [http://tas.milk-it.net]
* daviscabral [http://blog.impactmedia.com.br]
* tapajos [http://www.improveit.com.br/tapajos]
* tchandy [http://tchandy.wordpress.com]
* ozsantana [http://blog.iconcreative.net]
* lucasuyezu [http://xucros.com]
* samflores [http://www.thoughtsoverflow.com]
* dcrec1 [http://www.mouseoverstudio.com/blog]
* nuxlli [http://www.nuxlli.com.br]
* ernestonakamura [http://github.com/ernestonakamura]

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

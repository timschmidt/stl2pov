This is a terribly hacked version of stl2pov available here: http://www.xs4all.nl/~rsmith/software/#stl2pov

Adjustments by Rue Mohr.



To use:

stl2pov example.stl > example.pov
povray +Iexample.pov +Oexample.png +D +P +W640 +H480 +A0.5


![ ](sample.png)

Original README follows:

INTRODUCTION
------------
This is the readme file for version 2.4.4 of the 'stl2pov' program,
released on 2009-10-29.

The purpose of this program is to convert an STL (Standard Triangulation
Language) file (in ASCII or binary format) to a POV-ray mesh object. It
creates either triangles by default, but can generate smooth_trianges. For
more information, see the manual page stl2pov.1.

CHANGES
-------
2.4.3: Fix reading big binary stl files on windows.
2.4.2: Reduced some errors to warnings. Made the program somewhat more
       informative.
2.4.1: Add status reporting to monitor progress, especially on big files.
2.4.0: Add option to set allowed distance between vertexes that are assumed
       to be the same.
2.3.0: Follow the new syntax for povray: use 'triangle' instead of 'facet'.
2.2.1: Makefile fixes for better cooperation with FreeBSD ports.
2.2.0: Switch from GPL to 2-clause BSD license. Added FreeBSD port.
2.1.0: Switch to new parser.
2.0.0: Parses binary STL files.

LICENSE
-------
See the LICENSE file.

BUILDING THE PROGRAM
--------------------
For building on FreeBSD and other systems with the GNU toolset, see the
instructions in the file INSTALL. After installation, a manual page for
this program can be read with 'man stl2pov'. Additional documentation is
available in the documentation directory. See the Makefile.

I have set up a cross-compiler to produce a win32 binary. You can find it
in the file stl2pov-2.4.4.zip on my website;
http://www.xs4all.nl/~rsmith/software/

If anyone wants to donate makefiles or project files for other systems and
compilers I will be happy to include them in the distribution.

FEEDBACK
--------
This program was written by Roland Smith.

If you have caught a bug, or if you have thought of a feature that you
think should be added, by all means report it or (even better :-) send a
patch.

Please do not send me mail in HTML only format. These will be marked as
spam and deleted by my mail filter.

You can reach me at the following addresses:

    e-mail: rsmith@xs4all.nl      (preferred)
            R.Smith@philips.com   (alternative)

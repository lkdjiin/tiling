TILING
================

Description
----------------------
**Tiling** provides a *simple window tiling* system for linux.
This is for those who cannot (or don't want to) use a tiling window manager like
awesome or Xmonad.

There is no menu nor GUI in **tiling**. This is because I want to keep
**tiling** as simple as possible. You just (optionaly) focus a window and
press a keyboard shortcut and that's it: all windows in the current virtual
desktop are tiled.

For now **tiling** provides two layouts: horizontal and vertical, where a
«master» window occupy the top, or the left, of the screen, while remaining
windows share the rest of the screen.

###Examples

![Vertical, 2 windows](screenshots/Capture-3-small.png)

![Horizontal, 2 windows](screenshots/Capture-4-small.png)

![Vertical, 3 windows](screenshots/Capture-5-small.png)

![Horizontal, 3 windows](screenshots/Capture-6-small.png)



Install
-------------------------

### Installing the gem

*Using rvm is highly recommended.*

If your system ruby is at least 1.9.2 :

    rvm use system
    gem install tiling

That's it, go to create keyboard shortcuts. But if your system ruby
is older, you'll need the following trick.

    rvm use 1.9.3@global
    gem install tiling
Now, copy the file shell/tiling.sh somewhere in your path (maybe in
$HOME/bin) and **edit the last but one line** to reflect your rvm settings.

### Create keyboard shortcuts

In Debian, open System > Preferences > Keyboard shortcuts.
Click Add to add a new shortcuts. In name, enter «Horizontal layout»,
in command, enter «tiling -H» (uppercase H). If you are using tiling.sh,
you have to enter «tiling.sh -H» instead of «tiling -H».

Then close the dialog and make your shortcut, maybe Mod4+h, or Ctrl+Alt+h,
or whatever you want.

Do this again for a second shortcut. Name it «Vertical layout», enter the
command «tiling -V» (or «tiling.sh -V») and make the shortcut you want.
Note the uppercase V.

Usage
--------------------------

Easy. Focus a window and type your shortcut.

Dependencies
--------------------------

ruby >= 1.9.2

License
--------------------------

MIT

    Copyright (c) 2013 Xavier Nayrac

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Questions and/or Comments
--------------------------

Feel free to email [Xavier Nayrac](mailto:xavier.nayrac@gmail.com)
with any questions.

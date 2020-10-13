1. go to /usr/share/X11/xkb/symbols
2. copy mswindows-capslock into the /usr/share/X11/xkb/symbols
3. copy a layout to start from, e.g. `cp fr my_layout`
4. edit my\_layout to add `include "mswindows-capslock"` after the first include 
5. in sway config add `input * xkb_layout "my_layout"`

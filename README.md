# xed-vala-plugin

## Requirements

To interface with xed some libraries are needed:

* libpeas-1.0-dev
* libpeas-gtk-1.0
* libglib2.0-dev
* libgtk-3-dev
* libgtksourceview-4-dev
* libxapp-dev
  
## Vapi files

Run <code>create-vapi.sh</code> in <code>vapi</code> folder and copy <code>xed.vapi</code> and <code>xed.deps</code> in 
    
    /usr/share/vala/vapi/

## Missing Xed headers

Copy <code>Xed-1.0.h</code> from <code>missing-xed-headers</code> folder to

    /usr/include/

and remaining header files to

    /usr/include/xed/

## Install

I still haven't tested install routine of the meson build so run <code>run.sh</code> and then:

    sudo cp build/src/libValaPlugin.so /usr/lib/x86_64-linux-gnu/xed/plugins/libValaPlugin.so
    sudo cp data/valaplugin-plugin.desktop.in /usr/lib/x86_64-linux-gnu/xed/plugins/valaplugin.plugin

Run <code>xed</code> from the command line and go to <i>Preferences->Plugin</i> and enable the <code>ValaPlugin</code>. 
You can verify the plugin preferences pane and information with the bottom buttons.
And also you can see in the terminal the print messages of activation and deactivation (on close of xed window).

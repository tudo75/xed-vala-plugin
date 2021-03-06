# xed-vala-plugin

My first attempt to write a Xed plugin in Vala

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

Run <code>run.sh</code> to install with meson build system.

Or if you want to do it manually:

    meson setup build --prefix=/usr
    ninja -C build -v com.github.tudo75.xed-vala-plugin-pot
    ninja -C build -v com.github.tudo75.xed-vala-plugin-update-po
    ninja -C build -v com.github.tudo75.xed-vala-plugin-gmo
    ninja -C build -v
    sudo cp build/src/libValaPlugin.so /usr/lib/x86_64-linux-gnu/xed/plugins/libValaPlugin.so
    sudo cp data/valaplugin-plugin.desktop.in /usr/lib/x86_64-linux-gnu/xed/plugins/valaplugin.plugin

Run <code>xed</code> from the command line and go to <i>Preferences->Plugin</i> and enable the <code>ValaPlugin</code>. 
You can verify the plugin preferences pane and information with the bottom buttons.
And also you can see in the terminal the print messages of activation and deactivation (on close of xed window).

## Uninstall

If you installe through meson system:
    
    sudo ninja -C build -v uninstall
    
If you installed manually then:

    sudo rm /usr/lib/x86_64-linux-gnu/xed/plugins/libValaPlugin.so
    sudo rm /usr/lib/x86_64-linux-gnu/xed/plugins/valaplugin.plugin

## Credits

Based on this Gedit Plugin example

https://wiki.gnome.org/Projects/Vala/Gedit3PluginSample

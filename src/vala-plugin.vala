/*
 * vala-plugin.vala
 *
 * Copyright 2021 Nicola Tudino
 *
 * This file is part of xed-vala-plugin.
 *
 * xed-vala-plugin is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 3 of the License.
 *
 * xed-vala-plugin is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with xed-vala-plugin.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-only
 */


namespace XedValaPugin {


    /*
    * Register plugin extension types
    */
    [CCode (cname="G_MODULE_EXPORT peas_register_types")]
    [ModuleInit]
    public void peas_register_types (TypeModule module) 
    {
        var objmodule = module as Peas.ObjectModule;

        // Register my plugin extension
        objmodule.register_extension_type (typeof (Xed.ViewActivatable), typeof (XedValaPugin.ValaPlugin));
        // Register my config dialog
        objmodule.register_extension_type (typeof (PeasGtk.Configurable), typeof (XedValaPugin.ConfigValaPlugin));
    }
    
    /*
    * Plugin
    */
    public class ValaPlugin : Xed.ViewActivatable, Peas.ExtensionBase {

        public ValaPlugin () {
            GLib.Object ();
        }

        public Xed.View view {
            owned get; construct;
        }

        public void activate () {
            print ("ValaPlugin Plugin activated\n");
        }

        public void deactivate () {
            print ("ValaPlugin Plugin deactivated\n");
        }

        public void update_state () {
            print ("ValaPlugin Plugin status updated\n");
        }
    }


    /*
    * Plugin config dialog
    */
    public class ConfigValaPlugin : Peas.ExtensionBase, PeasGtk.Configurable
    {
        public ConfigValaPlugin () 
        {
            GLib.Object ();
        }

        public Gtk.Widget create_configure_widget () 
        {
            var label = new Gtk.Label (" Xed Vala Pugin\nExample plugin for Xed written in Vala ");
            label.set_margin_top (10);
            label.set_margin_bottom (10);
            label.set_margin_start (10);
            label.set_margin_end (10);
            return label;
        }
    }

}

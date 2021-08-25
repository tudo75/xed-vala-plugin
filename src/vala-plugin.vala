
namespace XedValaPugin {

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
            return new Gtk.Label (" Gedit 3.0 Example Vala Plugin ");
        }
    }

}

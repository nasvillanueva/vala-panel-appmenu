/*
 * vala-panel-appmenu
 * Copyright (C) 2016 Konstantin Pugin <ria.freelander@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
 
using Gtk;
using GLib;
using Appmenu;
    private bool factory_callback(MatePanel.Applet applet, string iid)
    {
        if (iid != "AppmenuApplet") {
            return false;
        }

        applet.flags = MatePanel.AppletFlags.HAS_HANDLE & MatePanel.AppletFlags.EXPAND_MINOR;

        var layout = new Appmenu.AppMenuBar();
        var widget = layout;
        applet.add(widget);
        applet.show_all();
        return true;
    }


int _mate_panel_applet_shlib_factory()
{
    GLib.Intl.bindtextdomain(Config.GETTEXT_PACKAGE,Config.LOCALE_DIR);
    GLib.Intl.bind_textdomain_codeset(Config.GETTEXT_PACKAGE,"UTF-8");
    return MatePanel.Applet.factory_main("AppmenuAppletFactory", false, typeof (MatePanel.Applet), factory_callback);
}

//void main(string[] args) {
//    Gtk.init(ref args);
//    MatePanel.Applet.factory_main("SNTrayAppletFactory", true, typeof (MatePanel.Applet), StatusNotifier.factory_callback);
//}

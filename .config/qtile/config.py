# ______________
# ___  /___  __ \      QTile Configuration file
# __  / __  /_/ /
# _  /___  _, _/
# /_____/_/ |_|

# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import subprocess
import json

from typing import List  # noqa: F401
from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal


class commands:
    """Command to run in various places in this config file."""
    autostart = os.path.join(os.path.dirname(__file__), 'autostart.sh')


@hook.subscribe.startup
def autostart():
    home = 'notify-send "QTile started"'
    subprocess.call([home])


@hook.subscribe.startup
def autostart_once():
    subprocess.call(commands.autostart)


mod = "mod4"
terminal = guess_terminal()

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),

    Key([mod, "shift"], "space", lazy.layout.flip()),

    # Added for the XmonadTall layout
    Key([mod], "o", lazy.layout.grow()),
    Key([mod], "i", lazy.layout.shrink()),
    Key([mod], "m", lazy.layout.maximize()),
    Key([mod], "b", lazy.layout.reset()),

    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "t", lazy.window.toggle_floating()),
    Key([mod], "y", lazy.window.inspect()),
    Key([mod], "d", lazy.window.up_opacity()),
    Key([mod], "s", lazy.window.down_opacity()),

    # move to the adjacent screen
    Key([mod], "comma", lazy.screen.prev_group()),
    Key([mod], "period", lazy.screen.next_group()),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "p", lazy.spawn("dmenu_run"), desc="dmenu"),
    # Key([mod], "l", lazy.spawn("systemctl suspend"), desc="Suspend the system"),
    Key([mod, "control"], "h", lazy.spawn("systemctl suspend"), desc="Suspend the system"),
    Key([mod, "control"], "l", lazy.spawn("xset s activate"), desc="Activate the lock screen"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),

    # Change the volume if your keyboard has special volume keys.
    Key(
            [], "XF86AudioRaiseVolume",
            # lazy.spawn("amixer -c 0 -q set Master 2dB+")
            lazy.spawn("/home/luc/.config/herbstluftwm/setvol.sh 5%+")
            ),
    Key(
            [], "XF86AudioLowerVolume",
            # lazy.spawn("amixer -c 0 -q set Master 2dB-")
            lazy.spawn("/home/luc/.config/herbstluftwm/setvol.sh 5%-")
            ),
    Key(
            [], "XF86AudioMute",
            lazy.spawn("amixer -c 0 -q set Master toggle")
            ),
]

# groups = [Group(i) for i in "123456789"]
groups = []
group_names = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
group_labels = ["", "", "", "", "", "", "", "", "9"]
group_layouts = ["monadtall", "tile", "monadtall", "monadtall", "monadtall",
                 "monadtall", "monadtall", "monadtall", "monadtall"]

for (i, g) in enumerate(group_names):
    groups.append(
        Group(
            name=group_names[i],
            layout=group_layouts[i].lower(),
            label=group_labels[i],
        ))

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

class colors:  # pylint: disable=too-few-public-methods
    """Definition of colors, grouped together in a class."""
    accent1 = "C6D729"          # lime
    accent1_inverse = "000000"  # text showing on accent1 background
    # accent2 = "1D2330"
    # accent2 = "EDC9AF"
    # accent2 = "3A29D7"
    # accent2 = "00A693"
    # accent2 = "5A2FD1"
    accent2 = "2FD1AB"


layout_theme = dict(
        border_width=1,
        margin=5,
        # "border_focus": "ff0000",
        border_focus=colors.accent1,
        border_normal="1D2330",
        )


# MonadTall, with a small modification.
class MonadTall(layout.MonadTall):
    """Fixes the reset functionality, which the stock Monad Tall doesn't handle correctly."""

    def __init__(self, **config):
        layout.MonadTall.__init__(self, **config)
        if "ratio" in config:
            self._med_ratio = config["ratio"]
        else:
            self._med_ratio = 0.618033989


layouts = [
    layout.Columns(border_focus_stack='#d75f5f',
                   **layout_theme),
    layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2, **layout_theme),
    # layout.Bsp(),
    # layout.Matrix(),
    MonadTall(ratio=0.618033989,
              min_ratio=0.5,
              max_ratio=0.75,
              change_ratio=0.01,
              single_margin=0,
              single_border_width=0,
              **layout_theme),
    # layout.MonadTall(ratio=0.618033989,
    #                  min_ratio = 0.5,
    #                  max_ratio=0.75,
    #                  change_ratio=0.01,
    #                  single_margin=0,
    #                  single_border_width=0,
    #                  **layout_theme),
    # layout.TreeTab(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    layout.Tile(expand=True,
                **layout_theme),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(
    # font='sans',
    # font='Hack',
    font='Iosevka bold',
    fontsize=14,
    padding=3,
    this_current_screen_border=colors.accent1,
    this_screen_border=colors.accent1,
    block_highlight_text_color=colors.accent1_inverse,
    border_color=layout_theme['border_focus'],
)
extension_defaults = widget_defaults.copy()

# Load the openweather config
# with open('/home/luc/.openweather', 'r') as f:
#     openweather = json.loads(f.read())

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=0,
                    # padding = 6,
                    # foreground = colors[2],
                    # background = colors[0]
                    ),
                widget.Image(
                    filename="~/.config/qtile/icons/python.png",
                    scale="False",
                    mouse_callbacks={'Button1': lambda: qtile.cmd_spawn("jgmenu_run")}
                    ),
                widget.GroupBox(
                    borderwidth=1,
                    # highlight_color=layout_theme['border_focus'],
                    # highlight_color=['ff0000', '00ff00'],
                    highlight_method='block',
                    rounded=True,
                    margin=3,
                    font='Hack',
                    disable_drag=True,
                    ),
                widget.Sep(),
                widget.CurrentLayoutIcon(scale=0.6),
                widget.CurrentLayout(width=77),
                widget.Sep(),
                # widget.OpenWeather(
                #     app_key=openweather['key'],
                #     cityid=openweather['city']),
                widget.Sep(),
                # widget.NetGraph(border_width=1,
                #                 line_width=4,
                # type='box'),
                widget.Sep(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # widget.TextBox("default config", name="default"),
                # widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # widget.Net(interface="enp2s0"),
                widget.CPU(format='CPU {load_percent:5.2f}%'),
                widget.Sep(),
                widget.CPUGraph(samples=30,
                                core='all',
                                graph_color=colors.accent2,
                                border_width=1,
                                line_width=4,
                                type='box'),
                widget.Sep(),
                widget.Systray(),
                # https://docs.python.org/3/library/datetime.html#strftime-strptime-behavior
                widget.Sep(),
                widget.Clock(format='%d/%m %a %H:%M'),
                # widget.QuickExit(),
                widget.Sep(),
                widget.CheckUpdates(distro='Arch', no_update_string="No"),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]


dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='gnome-calculator'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

#!/usr/bin/env bash

# /path/to/examples/exec_on_tag.sh web firefox &
# pidgin &
# polybar -r example &
# how to active bluez, i.e. blutoothd?
# run lxsession

pidof -q lxsession || lxsession &
pidof -q dunst     || dunst &

# Run volnoti to get fancy stuff with the media keys
pidof -q volnoti   || volnoti -t 1.5 -r 10 -a 0.2 &
pidof -q picom     || picom &
nitrogen --restore &

# pidof -q pasystray || pasystray &
# pidof -q blueman-tray || blueman-tray &
pidof -q blueman-applet || blueman-applet &

pidof -q xscreensaver || xscreensaver --no-splash &

pidof -q xsettingsd || xsettingsd &

# Keyboard layout applet
pidof -q gxkb || gxkb &

# see man xkeyboard-config
# https://simpleit.rocks/linux/switch-keyboard-layouts/
    # -option grp:ctrls_toggle\   # switch keyboard layout with both control keys
    # -option grp_led:caps\       # use caps lock LED to signal alt keymap is used
    # -option caps:ctrl_modifier\ # CAPS lock behaves like ctrl
    # -option eurosign:e          # AltGr-e is euro sign
setxkbmap \
    -model pc105 \
    -layout us,us \
    -variant altgr-intl, \
    -option grp:ctrls_toggle\
    -option grp_led:caps\
    -option caps:ctrl_modifier\
    -option eurosign:e

# https://github.com/google/xsecurelock
export XSECURELOCK_SWITCH_USER_COMMAND="gdmflexiserver"
export XSECURELOCK_PASSWORD_PROMPT="disco"
export XSECURELOCK_SAVER="saver_xscreensaver"

# For screen locking, check out https://github.com/google/xsecurelock
if ! pidof -q xss-lock; then
    xset s 600
    xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &
fi


# Run redshift to automatically adjust the jue based on the time of the day.
# http://jonls.dk/redshift/
if ! pidof -q redshift; then
    redshift-gtk -P -c ~/.config/redshift/config.toml &
fi

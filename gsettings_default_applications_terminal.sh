#!/bin/bash

# org.gnome.default-applications.terminal API has been deprecated in Gnome 43.2

# Display old settings
gsettings get org.gnome.desktop.default-applications.terminal exec


# To set gnome-terminal as default terminal
# gsettings set org.gnome.desktop.default-applications.terminal exec 'gnome-terminal'


# To set console (kgx) as default terminal
# gsettings set org.gnome.desktop.default-applications.terminal exec 'kgx'


# To set alacritty as default terminal
# gsettings set org.gnome.desktop.default-applications.terminal exec 'alacritty'


# Display new settings
gsettings get org.gnome.desktop.default-applications.terminal exec

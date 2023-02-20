# Custom keybindings

# Keymap 1

# xclip works only on Xorg
if [[ "$(echo $XDG_SESSION_TYPE)" = "x11" ]]; then
    echo "XDG_SESSION_TYPE is x11"

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Read Selected Text'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'bash -c "xclip -o | festival --tts"'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>r'

elif [[ "$(echo $XDG_SESSION_TYPE)" = "wayland" ]]; then
    echo "XDG_SESSION_TYPE is wayland"

    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Read Selected Text'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command 'bash -c "wl-paste | festival --tts"'
    gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>r'

else     
    echo "XDG_SESSION_TYPE cannot be recognized"

fi


# Keymap 2

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Kill Read Text'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'bash -c "pkill audsp"'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>k'



# Display new Keymaps


echo " "
echo "Displaying new Gnome Custom Global Keyboard Shortcuts"
bash ~/scripts_bash/gsettings_custom_keybindings_get.sh


# Waybar Configaration

1. Locate your Waybar Configuration

Usually, Omarchy stores these in your home directory. Open your terminal (Alacritty or Kitty) and check this path:
```~/.config/waybar/config.jsonc (or config)
```
2. Add the Modules to the Config
Open that file in Neovim and look for the "modules-right" or "modules-center" section. You need to add the names of the modules you want to display:

```JSON
"modules-right": [
    "network",
    "cpu",
    "memory",
    "tray",
    "clock"
],
Then, scroll down to define the settings for each. You can paste these blocks into the main body of the JSON file:

JSON
"cpu": {
    "interval": 10,
    "format": "  {usage}%",
    "tooltip": false
},
"memory": {
    "interval": 30,
    "format": "  {}%",
    "tooltip-format": "{used:0.1f}G/{total:0.1f}G"
},
"network": {
    "interval": 1,
    "format-wifi": "  {essid}",
    "format-ethernet": "󰈀  {ifname}",
    "format-disconnected": "Disconnected",
    // This shows Download and Upload speeds
    "format-alt": "󰓅 {bandwidthDownBits} | 󰓅 {bandwidthUpBits}",
    "tooltip-format": "{ifname} via {gwaddr}"
},
3. Styling with CSS
To make them look clean, open ~/.config/waybar/style.css. You can add specific colors or padding for these modules:

CSS
#cpu, #memory, #network {
    padding: 0 10px;
    color: #ffffff;
}

#cpu {
    background-color: #383c4a;
}

#memory {
    background-color: #4b5162;
}
4. Refresh Waybar
After saving the files, you usually need to restart Waybar to see the changes. You can do this by killing the process and restarting it:
killall waybar && waybar &

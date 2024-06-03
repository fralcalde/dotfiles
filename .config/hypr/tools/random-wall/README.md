# random-wall

A utility to randomize wallpapers from a directory using hyprpaper and systemd

## How to use:

1. Copy random-wall.sh to /usr/bin/random-wall
2. Copy random-wall.service and random-wall.timer to /etc/systemd/user/
3. Execute `systemctl --user enable random-wall.timer`

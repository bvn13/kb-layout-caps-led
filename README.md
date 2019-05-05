# kb-layout-caps-led

> Switching on and off capslock led according to the keyboard layout

This project is againts to show your keyboard layout switching with CapsLock LED indicator.

## Installation

There are two systemd daemons: one is running from user, the other one as root.

### User's daemon is against of to determine the current keyboard layout and tell it to root's daemon

```bash
> systemctl --user enable /%FULL_PATH_TO%/daemons/gnome-kb-layout-watcher.service
```

```bash
> systemctl --user start gnome-kb-layout-watcher.service
```

### Root's daemon is against of to set up the CapsLock LED indicator according of user's daemon data

```bash
> sudo cp /%FULL_PATH_TO/daemons/kb-layout-signal-watcher.service /etc/systemd/system/kb-layout-signal-watcher.service
```

```bash
> sudo systemctl enable kb-layout-signal-watcher.service
```

```bash
> sudo start kb-layout-signal-watcher.service
```

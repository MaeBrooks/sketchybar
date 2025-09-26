# My simple config for the Macos Sketchybar program.

** Because who doesn't want bongo cat on their status bar? **

![Bongo cat](bc-1.png)

## Requirements

- [jq](https://jqlang.org/)
- [sketchybar](https://felixkratz.github.io/SketchyBar/)
- Optional: [hack nerd font](https://formulae.brew.sh/cask/font-hack-nerd-font)

Both can be installed with brew

## Setup

1. Clone this repository to your `$XDG_CONFIG_PATH`

```sh
mkdir -p $HOME/.config
cd $HOME/.config
git clone <this git repo>
```

2. Install dependencies

```sh
brew install jq sketchybar
brew install --cask font-hack-nerd-font
```

3. Update the USER definition in `keylistener.c` to your user

From:
```c
#define USER "zoft"
```

To: (Example user: 'jill')
```c
#define USER "jill"
```

4. Compile the key listener (which just listens to key presses and emits an event)

```sh
sudo make
```

You must compile with `sudo` because the keylistener requires access to the accessbility api libraries

## Running

1. Open up a shell and run, alternativly refer to the [sketchybar](https://felixkratz.github.io/SketchyBar/) documentation, for a more permanent setup outside of a terminal

```sh
sketchybar
```

2. Open another shell and run the key listener

```sh
sudo ./keylistener
```

The keylistener executable needs sudo access in order to access the actual accessbility api itself
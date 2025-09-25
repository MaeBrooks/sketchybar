# My simple config for the Macos Sketchybar program.

** Because who doesn't want bongo cat on their status bar? **

![Bongo cat](bc-1.png)

## Requirements

- [jq](https://jqlang.org/)
- [sketchybar](https://felixkratz.github.io/SketchyBar/)
- Optional: [hack nerd font](https://formulae.brew.sh/cask/font-hack-nerd-font)

```sh
brew install jq
brew install sketchybar
brew install --cask font-hack-nerd-font
```

Both can be installed with brew

## Running

1. Compile `keylistener.c` using `sudo make`
2. start `sketchybar`
3. start ./keylistener

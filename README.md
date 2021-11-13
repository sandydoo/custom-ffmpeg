# Compile a useful build of ffmpeg

It’s always been a bit of a pain getting a working build of ffmpeg with
proprietary libraries enabled. Homebrew, actually, got quite close to being
painless until I got fed up with how it absolutely littered the working
environment with build dependencies. There’s no dependency tracing in Homebrew,
so have fun figuring out why you have a tool or library installed. Nix is
comparatively rough around the edges when it comes to UX, but makes dealing with
ffmpeg so easy, it feels like cheating.


### Nix >= 2.4

First, take a look at the options available in the `ffmpeg-full` available in `nixpkgs`.

```sh
nix edit nixpkgs#ffmpeg-full
```

Edit `flake.nix`, adding the options you need. Using flakes on nix >= 2.4:

```sh
nix profile install
```


### Nix < 2.4

Edit `default.nix` and then run:

```sh
nix-env -i -f default.nix
```


### Manual build from source

Clone the ffmpeg repo, copy over the `custom_make_file.sh`, and run it. Then
mess about with copying the output to the write locations on your machine.


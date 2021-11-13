with import <nixpkgs> {};

# For systems that don’t support flakes
{
  ffmpeg-custom =
    let
      overrides = {
        nonfreeLicensing = true;
        fdkaacExtlib = true;
      };

      attrs = {
        name="ffmpeg-custom-" + ffmpeg.version;
      };
    in
    ffmpeg-full.override overrides // attrs;
}


{
  modulesDir,
  lib,
  ...
}:
let
  validFiles = lib.pipe modulesDir [
    builtins.readDir
    (lib.filterAttrs (
      name: type: type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix"
    ))

    (lib.mapAttrsToList (name: _: modulesDir + "/${name}"))
  ];
in
{
  imports = validFiles;
}

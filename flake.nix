{
  description = "A Nix-flake-based Go development environment";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1"; # unstable Nixpkgs

  outputs =
    { self, ... }@inputs:

    let

      supportedSystems = [
        # Arduino IDE in nixpkgs only supports x86-64-linux
        "x86_64-linux"
      ];
      forEachSupportedSystem =
        f:
        inputs.nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import inputs.nixpkgs {
              inherit system;
            };
          }
        );
    in
    {

      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              arduino-ide
              arduino
              # not sure if this is needed in addition
              arduino-core

              # for debugging
              gdb

              # for flashing esp32's
              esptool
            ];
          };
        }
      );
    };
}

{
  description = "The environment for Kotlin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    devShells.x86_64-linux.default = let

      pkgs = nixpkgs.legacyPackages.x86_64-linux;

      name = "kotlin";

      common = import ../common { inherit pkgs name; };

    in (pkgs.buildFHSEnv {
      inherit name;
      profile = ''
        source /etc/bashrc.local
      '';
      targetPkgs = pkgs: with pkgs; [
        common.bashrcLocal jdk11
      ];
    }).env;
  };
}

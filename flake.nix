{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:hcssmith/nixpkgs";
    application-builders = {
      url = "github:hcssmith/application-builders";
      #url = "git+file:///home/hcssmith/Projects/application-builders/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-lib = {
      url = "github:hcssmith/flake-lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    flake-lib,
    application-builders,
    ...
  }:
    flake-lib.lib.mkApp {
      inherit self;
      name = "wezterm";
      drv = p:
        application-builders.lib.mkWezterm {
          pkgs = p;
          config = {
          };
        };
    };
}

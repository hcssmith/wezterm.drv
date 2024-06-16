{
  description = "A very basic flake";

  inputs = {
    application-builders.url = "github:hcssmith/application-builders";
    #application-builders.url = "git+file:///home/hcssmith/Projects/application-builders";
    flake-lib.url = "github:hcssmith/flake-lib";
  };

  outputs = {
    self,
    flake-lib,
    application-builders,
  }:
    flake-lib.lib.mkApp {
      inherit self;
      name = "wezterm";
      drv = p:
        application-builders.lib.mkWezterm {
          pkgs = p;
          config = {};
        };
    };
}

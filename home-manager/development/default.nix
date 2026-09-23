{ pkgs, ... }:

{
  imports = [
    ./lang.nix
    ./cloud.nix
    ./orchestration.nix
    ./devops.nix
    ./ssg.nix
    ./openssl.nix
  ];
  home.sessionVariables = {
    OPENSSL_NO_VENDOR = 1;
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };
}

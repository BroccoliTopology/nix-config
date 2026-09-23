{ pkgs, ... }:

{
  # pgms that are not home manager programs
  home.packages = with pkgs; [
    poppler-utils
    qpdf
  ];
}

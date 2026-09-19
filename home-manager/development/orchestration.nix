{ pkgs, ... }:

{
  home.packages = with pkgs; [
    apache-airflow
    luigi
  ];
}

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    awscli2
    snowflake-cli
    # azure-cli
    # google-cloud-sdk
    # databricks-cli
  ];
}

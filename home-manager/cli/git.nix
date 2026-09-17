{ ... }:

{
  programs= {
    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        core = {
          editor = "vim";
        };
        user = {
          email = "samuelw3068@gmail.com";
          name = "samuelw";
        };
        push.autoSetupRemote = true;
      };
    };

    # GitHub CLI
    gh = {
      enable = true;
      settings = {
        git_protocol = "ssh";
      };
    };
  };
}

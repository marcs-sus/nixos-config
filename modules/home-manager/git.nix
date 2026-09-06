{
  ...
}:
{
  programs.git = {
    enable = true;
    includes = [ { path = "~/.config/git/credentials"; } ];

    settings = {
      init.defaultBranch = "main";
    };
  };
}

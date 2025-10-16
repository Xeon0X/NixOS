{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Xeon0X";
    userEmail = "xeon0x.gaming@gmail.com";
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINPpQJnllGAE1hyrZFuRcALJEtzgEnLI8VYq0EETf3lJ (encrypted)";
      signByDefault = true;
      format = "ssh";
    };
    extraConfig = {
      pull.rebase = true;
      merge.conflictstyle = "zdiff3";
      merge.tool = "vimdiff";
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only";
      delta = {
        navigate = true;
        dark = true;
        side-by-side = true;
      };
      diff.colorMoved = "default";
      rebase.autoStash = true;
      merge.autoStash = true;
      status.showStash = true;
      push.autoSetupRemote = true;
    };
  };
}

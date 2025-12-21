###########
# lf Config
###########
{
  config,
  pkgs,
  programs,
  ...
}:

{
  programs.lf = {
    enable = true;

    settings = {
      # shellopts = '-eu';
      # ifs = "\n";
      scrolloff = 10;
      drawbox = true;
      hidden = true;
      relativenumber = true;
      period = 1;
      autoquit = true;
    };
  };

  home.packages = with pkgs; [
    lf
    ctpv # File previewer
  ];
}

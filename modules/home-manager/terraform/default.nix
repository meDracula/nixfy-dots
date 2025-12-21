########################
# Home Manager Terraform
########################
{
  config,
  pkgs,
  programs,
  ...
}:

{
  home.packages = with pkgs; [
    tfswitch
    tf-summarize
    tflint
    tfsec
    terraform-docs
  ];

  home.file.".tfswitch.toml".text = ''
    bin = "${config.home.homeDirectory}/.local/bin/terraform"
    version = "1.12.2"
  '';
}

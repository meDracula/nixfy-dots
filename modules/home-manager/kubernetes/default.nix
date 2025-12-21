#########################
# Home Manager Kubernetes
#########################
{ config, pkgs, ... }:

let
  kubeConfigFile = ./kubeconfig.yaml;
in
{
  home.packages = with pkgs; [
    kubectl
    kubectx
    k9s
    kubeshark
    kubernetes-helm
    argocd
  ];

  # WIP: The file kubeConfigFile must be secretly handled but requires read access for nixpkg (rething required!)
  # home.file.".kube/config.src" = {
  #   text = builtins.readFile kubeConfigFile;
  #   onChange = ''
  #     cat "${config.home.homeDirectory}/.kube/config.src" > "${config.home.homeDirectory}/.kube/config"
  #     chmod 600 "${config.home.homeDirectory}/.kube/config"
  #   '';
  # };

  home.sessionVariables = {
    KUBECONFIG = "${config.home.homeDirectory}/.kube/config";
  };
}

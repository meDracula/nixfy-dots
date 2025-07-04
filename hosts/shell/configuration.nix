# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../users/ghost
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "shell"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "sv-latin1";

  #####################
  # Keyboard Moonlander
  #####################
  hardware.keyboard.zsa.enable = true;

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #######
  # Sound
  #######
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  ###########
  # Bluetooth
  ###########
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  ##########
  # Hyprland
  ##########
  # Enable Hyprland as window manager
  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };
  # inputs.hyprland.inputs.nixpkgs.follows = "nixpkgs";

  # Screen sharing with Wayland
  # services.dbus.enable = true;
  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   extraPortals = [
  #     pkgs.xdg-desktop-portal-gtk
  #   ];
  # };

  ##########
  # Packages
  ##########
  # List packages installed in system profile. To search, run:
  # $ nix search <package>
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    tree
    unzip

    # Nix utils
    nix-output-monitor
    nvd

    # Keyboard Moonlander
    wally-cli
    keymapp

    # Sound
    qpwgraph

    # Bluetooth
    bluez
    blueman

    # Home Manager
    home-manager

    # Wayland & Hyprland packages
    pciutils
    polkit
    xdg-desktop-portal-hyprland
    xwayland
    wayland-protocols
    wayland-utils
    wlroots
    wl-clipboard

    # Wallpaper manager
    hyprpaper

    # Notification deamon
    dunst
    libnotify

    # Terminal emulator
    alacritty

    # Web Browsers
    brave

    # Version control
    git

    # app launchers
    rofi-wayland

    # Password Store
    pass
    gnupg
    pinentry
    pinentry-curses

    # Yubikey
    yubikey-manager
    yubikey-personalization

    # VPN
    openvpn

    # RouterOS
    winbox4

    # Extra
    python3
  ];

  #######
  # Users
  #######
  programs.zsh.enable = true;
  ghost.enable = true;

  ###############
  # Environmental
  ###############
  # Environmental session variable
  environment.sessionVariables = {
    # Hint electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
    # Setting session variables
    EDITOR = "vim";
  };

  #######
  # Fonts
  #######
  fonts.packages = with pkgs; [
    fira-code
    meslo-lgs-nf
    iosevka
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  # programs.ssh.startAgent = true;

  #########
  # Yubikey
  #########
  # To use the smart card mode (CCID) of Yubikey
  services.pcscd.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall = {
    enable = true;
    # allowedTCPPorts = [ ... ];
    # allowedUDPPorts = [ ... ];
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}

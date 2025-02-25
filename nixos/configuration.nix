# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Flakes config
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Sound
  hardware.pulseaudio = {
  	enable = true;
	support32Bit = true;
	package = pkgs.pulseaudioFull;
  };
  services.pipewire.enable = false;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.anton = {
    isNormalUser = true;
    description = "anton";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  users.defaultUserShell = pkgs.zsh;
  environment.shells = with pkgs; [ zsh ];

  home-manager = {
  	extraSpecialArgs = { inherit inputs; };
	users = {
		"anton" = import ./home.nix;
	};
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	vim
	wget
	alacritty
	neovim
	yazi
	bspwm
	sxhkd
	polybar
	rofi
	git
	stow
	zsh
	caffeine-ng
	picom
	nitrogen
	eza
	zoxide
	chromium
	fzf
	ripgrep
	moar
	k9s
	(google-cloud-sdk.withExtraComponents [
		google-cloud-sdk.components.gke-gcloud-auth-plugin
		google-cloud-sdk.components.kubectl
		]
	)
	kubectl
	starship
	lazygit
	xorg.xbacklight
	brightnessctl
	pulseaudio
	pavucontrol
	pyenv
	tmux
	thefuck
	jq
	fx
	gcc
	clang
	cl
	zig
	vscode
	yarn
	nodejs_20
	btop
	kubecolor
	gnome-keyring
	git-credential-manager
	bat
	pamixer
	pnpm
	zsh-fzf-history-search
	mcfly
	postgresql_14
	pipx
	python311
	gcc-unwrapped
  xsel
  ];
  
  fonts.packages = with pkgs; [ nerdfonts ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.zsh = {
  	enable = true;
	enableCompletion = true;
	autosuggestions.enable = true;
	syntaxHighlighting.enable = true;
	ohMyZsh = {
		enable = true;
		plugins = [
			"aliases"
			"colored-man-pages"
			"copybuffer"
			"copypath"
			"dirhistory"
			"docker"
			"docker-compose"
			"emoji"
			"git"
			"history"
			"jsontools"
			"kubectl"
			"sudo"
			"thefuck"
			"tmux"
			"vi-mode"
			"z"
		];
		theme = "robbyrussell";
	};
  };


  environment.sessionVariables = {
  	GIT_ASKPASS = "";
	GIT_CREDENTIAL_STORE = "cache";
  };

  # Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
  	enable = true;
	setSocketVariable = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}

{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "thomas.steven";
  home.homeDirectory = "/Users/thomas.steven";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    actionlint
    air
    alacritty
    asciiquarium
    bash
    bat
    black
    btop
    cl-wordle
    curlie
    dig
    exa
    exif
    exiftool
    fd
    figlet
    gitleaks
    glow
    go_1_18
    gofumpt
    golangci-lint
    golangci-lint-langserver
    # golines
    gopls
    goreleaser
    gotest
    gotests
    gotools
    grc
    hadolint
    htop
    jq
    killall
    libqalculate
    lolcat
    lsof
    mpv
    mycli
    neofetch
    nerdfonts
    netcat
    nixfmt
    nmap
    nodePackages.eslint_d
    nodePackages.intelephense
    nodePackages.parcel
    nodePackages.prettier
    nodePackages.pyright
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.yaml-language-server
    nodejs
    ffmpeg
    obsidian
    packer
    pgcli
    pre-commit
    pylint
    python3
    ripgrep
    rnix-lsp
    rubyPackages_3_1.solargraph
    shellcheck
    shfmt
    slides
    statix
    stylua
    terraform-ls
    tflint
    tfswitch
    tgswitch
    tealdeer
    tfswitch
    tgswitch
    whois
    youtube-dl
    yq-go
    mdl
    gnused
    difftastic
    du-dust
  ];

  home.sessionVariables = {
    NIXPKGS_ALLOW_UNFREE = 1;
    EDITOR = "nvim";
  };
  home.file = {
    ".config/alacritty/alacritty.yml".source =
      config.lib.file.mkOutOfStoreSymlink ./alacritty.yml;
    ".config/alacritty/catppuccin.yml".source =
      config.lib.file.mkOutOfStoreSymlink ./alacritty-catppuccin.yml;
    ".config/karabiner/karabiner.json".source =
      config.lib.file.mkOutOfStoreSymlink ./karabiner.json;
    ".config/yabai/yabairc".source =
      config.lib.file.mkOutOfStoreSymlink ./yabairc;
    ".config/skhd/skhdrc".source = config.lib.file.mkOutOfStoreSymlink ./skhdrc;
    ".config/nix/nix.conf".source =
      config.lib.file.mkOutOfStoreSymlink ./nix.conf;

    ".config/nvim/init.vim".source =
      config.lib.file.mkOutOfStoreSymlink ./vim/init.vim;
    ".config/nvim/en.utf-8.add".source =
      config.lib.file.mkOutOfStoreSymlink ./vim/en.utf-8.add;

    ".config/nvim/lua/plugins.lua".source =
      config.lib.file.mkOutOfStoreSymlink ./vim/plugins.lua;
    ".config/nvim/lua/lsp.lua".source =
      config.lib.file.mkOutOfStoreSymlink ./vim/lsp.lua;

    ".local/scripts/".source = config.lib.file.mkOutOfStoreSymlink ./scripts;

    ".config/zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh".source =
      config.lib.file.mkOutOfStoreSymlink
        ./catppuccin_frappe-zsh-syntax-highlighting.zsh;
  };

  programs = {
    git = {
      enable = true;
      delta = { enable = true; };
      userName = "Thomas Steven";
      userEmail = "thomas.steven@humi.ca";
      extraConfig = {
        init = { defaultBranch = "main"; };
        help = { autocorrect = "immediate"; };
      };
    };
    zsh = {
      enable = true;
      dotDir = ".config/zsh_nix";
      shellAliases = {
        cat = "bat";
        curl = "curlie";
        cp = "cp -riv";
        dc = "docker compose";
        diff = "difft";
        du = "dust";
        e = "nvim";
        ec = "nvim --clean";
        ll = "ls -al";
        ls = "exa --group-directories-first --icons --color-scale";
        mkdir = "mkdir -vp";
        mv = "mv -iv";
        rm = "rm -v";
        tf = "terraform";
        tree = "exa --tree";
        hs = ''
          rm -rf "$HOME/Applications/Home Manager Apps" && home-manager switch'';
      };
      shellGlobalAliases = {
        "..." = "../..";
        "...." = "../../..";
        "....." = "../../../..";
        "......" = "../../../../..";
      };
      plugins = [
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "v0.7.0";
            sha256 = "KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
          };
        }
        {
          name = "zsh-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-syntax-highlighting";
            rev = "caa749d030d22168445c4cb97befd406d2828db0";
            sha256 = "YV9lpJ0X2vN9uIdroDWEize+cp9HoKegS3sZiSpNk50=";
          };
        }
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.5.0";
            sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
          };
        }
      ];

      history = {
        size = 10000;
        save = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      initExtraFirst = ''
        source ~/.config/zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh
      '';

      initExtra = ''
        stty stop undef		# Disable ctrl-s to freeze terminal.
        bindkey -e # emacs mode
        setopt appendhistory
        setopt COMPLETE_ALIASES
        setopt SHARE_HISTORY
        setopt HIST_IGNORE_DUPS

        # Basic auto/tab complete:
        autoload -U compinit
        zstyle ':completion:*' menu select
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zmodload zsh/complist
        compinit
        _comp_options+=(globdots)		# Include hidden files.

        # Cattpuccin FZF
        export FZF_DEFAULT_OPTS=" \
        --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
        --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
        --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

        # Scripts
        export PATH="$HOME/.local/scripts/:$PATH"
        export PATH="$HOME/bin/:$PATH"

        # edit in editor
        autoload -z edit-command-line
        zle -N edit-command-line
        bindkey "^X^E" edit-command-line
        bindkey "^E" edit-command-line
        bindkey '^ ' autosuggest-execute
        fancy-ctrl-z () {
          if [[ $#BUFFER -eq 0 ]]; then
            BUFFER="fg"
            zle accept-line -w
          else
            zle push-input -w
            zle clear-screen -w
          fi
        }
        zle -N fancy-ctrl-z
        bindkey '^Z' fancy-ctrl-z
        eval "$(/opt/homebrew/bin/brew shellenv)"
      '' + builtins.readFile ./git-helpers.sh;
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        scan_timeout = 2000;
        command_timeout = 2000;
        aws = { disabled = true; };
        terraform = { disabled = false; };
        git_commit = {
          disabled = false;
          tag_disabled = false;
        };
        status = { disabled = false; };
      };
    };

    bat = {
      enable = true;
      config = { };
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    gh = { enable = true; };

    neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [{ plugin = telescope-fzf-native-nvim; }];
    };
  };

  # This makes applications show up in spotlight
  home.activation = lib.mkIf pkgs.stdenv.isDarwin {
    copyApplications =
      let
        apps = pkgs.buildEnv {
          name = "home-manager-applications";
          paths = config.home.packages;
          pathsToLink = "/Applications";
        };
      in
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        baseDir="$HOME/Applications/Home Manager Apps"
        mkdir -p "$baseDir"
        for appFile in ${apps}/Applications/*; do
          target="$baseDir/$(basename "$appFile")"
          $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
          $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
        done
      '';
  };
}

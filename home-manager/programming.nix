{pkgs, ...}:
{
  home.packages = with pkgs; [
    ##### General packages
    gnumake

    ##### GO
    gofumpt
    golines
    golangci-lint

    # stress godex compilebench splitdwarf ifaceassert gotype go-contrib-init eg bundle shadow 
    # netrcauth stringer fieldalignment fuzz-driver authtest benchcmp gitauth godoc findcall 
    # gostacks unmarshal gomvpkg digraph fiximports nilness goyacc goimports fuzz-runner 
    # file2fuzz lostcancel html2article present2md cookieauth callgraph stringintconv ssadump 
    # present guru gopackages gorename toolstash
    gotools

    gomodifytags
    gopls
    gotests
    iferr
    impl
    # fillstruct fillswitch fixplurals
    reftools
    delve
    ginkgo
    richgo
    gotestsum
    mockgen
    govulncheck
    # json-to-struct
    # gomvp
    # gonew
    # go-enum

    ###### Rust
    cargo

    ##### Nix
    nixfmt
    nil

    ##### CLI stuff
    ripgrep
    fzf
    tldr

    ##### Cloud and kubernetes
    awscli2
    kind
    kubectx
    kubernetes-helm
    terraform
    terraform-lsp
    terragrunt
  ];
      programs.go = {
      enable = true;
      package = pkgs.go_1_17;
    };

}

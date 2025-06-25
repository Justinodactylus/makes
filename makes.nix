{ fetchNixpkgs, outputs, __nixpkgs__, ... }: {
  cache = {
    readNixos = true;
    extra = {
      makes = {
        enable = true;
        pubKey =
          "makes.cachix.org-1:zO7UjWLTRR8Vfzkgsu1PESjmb6ymy1e4OE9YfMmCQR4=";
        token = "CACHIX_AUTH_TOKEN";
        type = "cachix";
        url = "https://makes.cachix.org";
        write = true;
      };
    };
  };
  dev = {
    makes = {
      bin = [ __nixpkgs__.just __nixpkgs__.reuse ];
      source = [ outputs."/src/cli/runtime" ];
    };
  };
  formatBash = {
    enable = true;
    targets = [ "/" ];
  };
  formatNix = {
    enable = true;
    targets = [ "/" ];
  };
  formatTerraform = {
    enable = true;
    targets = [ "/" ];
  };
  formatYaml = {
    enable = true;
    targets = [ "/" ];
  };
  imports = [
    ./container/makes.nix
    ./docs/makes.nix
    ./src/makes.nix
    ./tests/makes.nix
    ./utils/makes.nix
  ];
  inputs = {
    nixpkgs = fetchNixpkgs {
      rev = "24.11";
      sha256 = "sha256:1gx0hihb7kcddv5h0k7dysp2xhf1ny0aalxhjbpj2lmvj7h9g80a";
    };
  };
  lintBash = {
    enable = true;
    targets = [ "/" ];
  };
  lintGitMailMap.enable = true;
  lintNix = {
    enable = true;
    targets = [ "/" ];
  };
  projectIdentifier = "makes-repo";
  testLicense.enable = true;
}

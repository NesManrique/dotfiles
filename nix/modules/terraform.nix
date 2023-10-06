{ pkgs, arch }:

let
  # Hash map where keys are arch strings and values are the corresponding hashes
  hashMap = {
    linux_amd64 = "0qyxnf496d18ddzi107195x8kqprn896ww9zz1x79pdhnhrgl1w5";
    darwin_arm64 = "06ibvw14zfwd5rzv8gv1v0n22k9pyj41gp6pl7vhphcvhlpzg7cr";
  };
  hash = builtins.getAttr arch hashMap // ""; 
in
pkgs.stdenv.mkDerivation rec {
  pname = "terraform";
  version = "1.5.7";
  
  src = pkgs.fetchurl {
    url = "https://releases.hashicorp.com/terraform/${version}/terraform_${version}_${arch}.zip";
    sha256 = hash; # replace with the actual sha256
  };
  
  nativeBuildInputs = [ pkgs.unzip ];
  
  installPhase = ''
    install -D $src $out/bin/terraform
  '';
}


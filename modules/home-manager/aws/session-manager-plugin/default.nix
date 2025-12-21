{
  stdenv,
  fetchurl,
  unzip,
  lib,
}:

stdenv.mkDerivation rec {
  pname = "session-manager-plugin";
  version = "1.2.707.0"; # https://docs.aws.amazon.com/systems-manager/latest/userguide/plugin-version-history.html
  # curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
  src = fetchurl {
    url = "https://s3.amazonaws.com/session-manager-downloads/plugin/${version}/ubuntu_64bit/session-manager-plugin.deb";
    sha256 = "91cc9a1a8df6f730622d5e11a8610be6e06d5858408e8029b56d0d63aedd0a68";
  };

  nativeBuildInputs = [ unzip ];

  unpackPhase = ''
        ar x $src
    	tar xf data.tar.gz
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp usr/local/sessionmanagerplugin/bin/session-manager-plugin $out/bin/
  '';

  meta = with lib; {
    description = "Session Manager Plugin for AWS CLI";
    homepage = "https://docs.aws.amazon.com/systems-manager/latest/userguiplugin-version-history.htmlde/session-manager-working-with-install-plugin.html";
    license = licenses.asl20; # AWS licenses
    platforms = platforms.linux;
  };
}

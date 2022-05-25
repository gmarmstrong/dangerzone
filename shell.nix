let
  pkgs = import <nixpkgs> { };
  stdenv = pkgs.stdenv;
  python = pkgs.python39;
  pythonPackages = pkgs.python39Packages;
  pythonEnv = (python.buildEnv.override {
    ignoreCollisions = true;
    extraLibs = with pythonPackages; [
      appdirs
      click
      colorama
      pip
      pyside2
      pyxdg
      virtualenv
      xdg
    ];
  });
in

pkgs.mkShell rec {
  buildInputs = [
    pythonEnv
    (if stdenv.isLinux then pkgs.podman else pkgs.docker)
  ];
  QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt5.qtbase.bin}/lib/qt-${pkgs.qt5.qtbase.version}/plugins";
}

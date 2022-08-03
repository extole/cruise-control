with (import <nixpkgs> {});
let
  buildGradle = callPackage ./gradle-env.nix {};
in
  buildGradle {
    envSpec = ./gradle-env.json;
    src = ./.;
    gradleFlags = [ "installDist" ];
    installPhase = ''
      mkdir -p $out
      cp -Rvp config $out/
      mkdir -p $out/cruise-control-metrics-reporter/build/
      cp -Rvp ./cruise-control-metrics-reporter/build/libs $out/cruise-control-metrics-reporter/build/
      mkdir -p $out/cruise-control/build
      cp -Rvp ./cruise-control/build/libs $out/cruise-control/build/
      cp -Rvp ./cruise-control/build/dependant-libs $out/cruise-control/build/
      mkdir -p $out/bin
      cp -Rvp kafka-cruise-control-*.sh $out/bin/
    '';
  }


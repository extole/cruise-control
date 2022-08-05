     with (import <nixpkgs> {});
     let
       buildGradle = callPackage ./gradle-env.nix {};
     in
       buildGradle {
         envSpec = ./gradle-env.json;

         src = ./.;

         #gradleFlags = [ "installDist" ];

         installPhase = ''
           mkdir -p $out
           cp -r app/build/install/myproject $out
         '';
       }

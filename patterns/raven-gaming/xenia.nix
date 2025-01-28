# From https://github.com/NixOS/nixpkgs/issues/108212

{ clangStdenv
, fetchFromGitHub
, lib
, python3
, pkg-config
, gtk3
, SDL2
, lz4
, libunwind
, libiberty
, xorg
, vulkan-loader
}:

let
  mkXenia =
    { src
    , version
    , suffix ? ""
    }:

    clangStdenv.mkDerivation {
      pname = "xenia${suffix}";
      inherit src version;

      nativeBuildInputs = [
        python3
        pkg-config
      ];

      buildInputs = [
        gtk3
        SDL2
        lz4
        libunwind
        libiberty
        xorg.libX11
        xorg.libxcb
      ];

      dontConfigure = true;

      NIX_CFLAGS_COMPILE = [
        "-Wno-error=unused-result"
        "-fno-lto"
      ];

      buildPhase = ''
        runHook preBuild
        python3 ./xb build --config release -j $NIX_BUILD_CORES
        runHook postBuild
      '';

      installPhase = ''
        runHook preInstall
        mkdir -p $out/bin
        cp -a ./build/bin/*/*/xenia $out/bin/
        runHook postInstall
      '';

      postFixup = ''
        patchelf --add-rpath ${vulkan-loader}/lib $out/bin/xenia
      '';

      meta =
        let
          inherit (lib) licenses platforms;
        in
        {
          description = "Xenia is an experimental emulator for the Xbox 360";
          homepage = "https://xenia.jp";
          license = licenses.bsd3;
          maintainers = [ ];
          platforms = platforms.linux;
        };

    };

in
{

  xenia = mkXenia {
    version = "unstable-2022-07-27";
    src = fetchFromGitHub {
      owner = "xenia-project";
      repo = "xenia";
      fetchSubmodules = true;
      rev = "7595cdb52bd12d448aeabe4908862f59d283ce9d";
      hash = "sha256-W6lOZxMwNTxSPIcu2f2hrq8bxT/aqxdLTSLV9D1KY0U=";
    };
  };

  xenia-canary = mkXenia {
    version = "unstable-2022-08-20";
    src = fetchFromGitHub {
      owner = "xenia-canary";
      repo = "xenia-canary";
      fetchSubmodules = true;
      rev = "010b59e81cee3459dc03ed40f814537c2f682b6c";
      hash = "sha256-Njbp9wiyinRnC+Qw1tIEWU4UtQXmEHjAR5I+0Q2z8m8=";
    };
  };

}

{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.default = with pkgs; pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            act
            pre-commit
            shellcheck
            yamllint
            hadolint
            nodePackages.prettier
            jq
          ];
          shellHook = ''
          '';
        };
      }
  );
}

{
  description = "Flake to run the notebook with all the dependencies.";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        config.cudaSupport = false;
      };
    in {
      devShells.${system}.default = pkgs.mkShell {
        name = "torch-ipython-env";
        packages = with pkgs; [
          python312Full
          (python312.withPackages (ps: with ps; [
            jupyterlab
            ipywidgets
            numpy
            matplotlib
            torch-bin
            tqdm
          ]))
        ];

        shellHook = ''
          echo "Running the jupyter server!"
          jupyter-server
        '';
      };
    };
}

{ python311, addDriverRunpath, cudaPackages }:
let
  python = let
    self = python311.override {
      packageOverrides = finalPy: prevPy: {
        triton-bin = prevPy.triton-bin.overridePythonAttrs (oldAttrs: {
          postFixup = ''
            chmod +x "$out/${self.sitePackages}/triton/backends/nvidia/bin/ptxas"
            substituteInPlace $out/${self.sitePackages}/triton/backends/nvidia/driver.py \
              --replace \
                'return [libdevice_dir, *libcuda_dirs()]' \
                'return [libdevice_dir, "${addDriverRunpath.driverLink}/lib", "${cudaPackages.cuda_cudart}/lib/stubs/"]'
          '';
        });
        spandrel = finalPy.callPackage ./deps/spandrel { };
        soundfile = finalPy.callPackage ./deps/soundfile { };
        segment-anything = finalPy.callPackage ./deps/segmet_anything { };
      };
    };
  in self;
in python
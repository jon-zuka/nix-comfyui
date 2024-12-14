{ pkgs }:
let python = pkgs.callPackage ./python.nix { };
packages = with python.pkgs; [
  torch-bin
  triton-bin
  torchvision-bin
  torchaudio-bin
  torchsde
  transformers
  tokenizers
  tqdm
  typing-extensions
  matplotlib
  einops
  safetensors
  sentencepiece
  aiohttp
  pyyaml
  pillow
  scipy
  psutil
  kornia
  spandrel
  soundfile
  gitpython
  pygithub
  huggingface-hub
  matrix-client
  typer
  rich
  pip
  timm
  numba
  simpleeval
  opencv4
  ffmpeg-python
  scikit-image
  piexif
  segment-anything
] ++ [ python ];

comfyui = pkgs.writeShellScriptBin "comfyui" ''
  echo 'ComfyUi'
'';
in [ comfyui ] ++ packages  

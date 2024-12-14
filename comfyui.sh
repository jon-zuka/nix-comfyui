nvidia-offload -- python ./srcs/ComfyUI/main.py \
  --input-directory=$NIX_COMFYUI_DATA/input \
  --output-directory=$NIX_COMFYUI_DATA/output \
  --temp-directory=$NIX_COMFYUI_DATA/tmp \
  --user-directory=$NIX_COMFYUI_DATA/user \
  --extra-model-paths-config=$NIX_COMFYUI_DATA/extra_model_paths.yaml
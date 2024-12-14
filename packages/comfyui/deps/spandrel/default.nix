{ buildPythonPackage, fetchPypi, setuptools,
torch, torchvision, safetensors, numpy, einops, typing-extensions }:

buildPythonPackage rec {
  pname = "spandrel";
  version = "0.4.0";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-9FUmiT+SOhLvN1QsROREsSCJdlk7x8zfpU/QTHw+gMo=";
  };

  doCheck = false;

  propagatedBuildInputs =
    [ torch torchvision safetensors numpy einops typing-extensions ];

  pyproject = true;
  build-system = [
    setuptools
  ];
}

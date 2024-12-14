{ buildPythonPackage, fetchPypi, setuptools }:

buildPythonPackage rec {
  pname = "segment-anything";
  version = "1.0";

  src = fetchPypi {
    pname = "segment_anything";
    inherit version;
    hash = "sha256-7Qyfb7B7vvnGI4pwKKE8gnLxumtjBcpz4+BkJmUDc2s=";
  };

  doCheck = false;

  propagatedBuildInputs = [ ];

  pyproject = true;
  build-system = [ setuptools ];
}

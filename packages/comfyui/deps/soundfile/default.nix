{ buildPythonPackage, fetchPypi, setuptools, wheel, cffi }:

buildPythonPackage rec {
  pname = "soundfile";
  version = "0.12.1";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6OEBeyzx3adnrvGdL9nuXr4H4FDUMPd6Cnxmugi4za4=";
  };

  doCheck = false;

  propagatedBuildInputs = [ cffi ];

  pyproject = true;
  build-system = [ setuptools wheel ];
}

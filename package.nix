{
  writeShellApplication,
  gnutar,
  netcat-openbsd,
}:
writeShellApplication {
  name = "taft";
  runtimeInputs = [
    gnutar
    netcat-openbsd
  ];
  text = builtins.readFile ./taft;
}

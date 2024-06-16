{ ... }:

{
  users.users = {
    linnovs = {
      isNormalUser = true;
      description = "linnovs";
      initialPassword = "capital-impose-june";
      extraGroups = [ "networkmanager" "wheel" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDIjRPXhIGrNUtCIdlzEoDmSq8tvAnPKtlnAgkH1//Ho linnovs@blazarmist"
      ];
    };
  };
}

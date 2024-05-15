{ ... }:

{
  users.users = {
    linnovs = {
      isNormalUser = true;
      description = "linnovs";
      initialPassword = "capital-impose-june";
      extraGroups = [ "networkmanager" "wheel" ];
      openssh.authorizedKeys.keys = [ ];
    };
  };
}

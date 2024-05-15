{ ... }:

{
  services.avahi.enable = true;
  services.geoclue2.enable = true;
  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}

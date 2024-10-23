{ config, lib, pkgs, ... }:

{
  services.bonfire = {
    # you will additionally need to expose bonfire with a reverse proxy, for example caddy
    port = 4000;
    package = pkgs.elixirBonfire;
    dbName = "bonfire";
    # the environment should contain a minimum of
    #   SECRET_KEY_BASE
    #   SIGNING_SALT
    #   ENCRYPTION_SALT
    #   RELEASE_COOKIE
    # have a look into nix/module.nix for more details
    # the way to deploy secrets is beyond this readme, but I would recommend agenix
    environmentFile = "/run/secrets/bonfireEnv";
    dbSocketDir = "/var/run/postgresql";
  };
	
	# this is specifically for a reverse proxy, which is primarily used for SSL certs
	services.ngnix = {
		enable = true;
		forceSSL = true;
		enableACME = true;
		virtualHosts."myHostName".locations.proxyPass = "http://localhost:4000";
	};
	
	# You will need to accept ACME's terms and conditions if you haven't elsewhere in your configuration
	security.acme.defaults.email = "you@myHostName.com";
	security.acme.acceptTerms = true;

  # this is uniquely for database backup purposes
  # replace myBackupUserName with the user name that will do the backups
  # if you want to do backups differently, feel free to remove this part of the config
  services.postgresql = {
    ensureDatabases = [ "bonfire" ];
    ensureUsers = [{
      name = "myBackupUserName";
      ensurePermissions = { "DATABASE bonfire" = "ALL PRIVILEGES"; };
    }];
  };
}

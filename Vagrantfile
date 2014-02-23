VAGRANTFILE_API_VSN = "2"

Vagrant::configure(VAGRANTFILE_API_VSN) do |config|

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "dummy"
  config.vm.define :server_name do |server_name|
    server_name.vm.hostname = 'monadexdev'
  end    

  config.vm.provider :digital_ocean do |provider, override|
    override.vm.box = 'digital_ocean'
    override.vm.box_url = "https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box"
    override.ssh.private_key_path = '~/.ssh/id_rsa_do'
    override.ssh.username = 'hongchao.liu'

    provider.client_id = $CLIENT_ID
    provider.api_key = $API_KEY
    provider.region = 'Amsterdam 2'
    provider.size = '2GB'
    provider.private_networking = true
    provider.ssh_key_name = 'hongchao.liu'
    provider.setup = true
  end
  
  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "192.168.33.10"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  
  config.vm.provision "shell", path: "./provision/shell/chef_solo_bootstrap.sh"

  # Setup the Synced folder here.
  #config.vm.synced_folder "spree", "/server/spree"
  #config.vm.synced_folder "monadex", "/server/monadex"
  
  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding 
  # some recipes and/or roles.
  #
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "./spree-dev-recipes/cookbooks"
    #chef.roles_path = "../my-recipes/roles"
    #chef.data_bags_path = "../my-recipes/data_bags"
    chef.add_recipe "apt"
    chef.add_recipe "mysql::server"
    chef.add_recipe "ohmyzsh"
    #chef.add_recipe "rvm::vagrant" # already in ohmyzsh
    #chef.add_recipe "rvm::user" #already in ohmyzsh
    chef.add_recipe "system_packages"
    #chef.add_role "web"
    #chef.log_level = :debug
    #
    # # You may also specify custom JSON attributes:
    chef.json = {
      mysql: {
        server_root_password: "",
        server_repl_password: "",
        server_debian_password: ""
      },
      rvm: { 
        default_ruby: "2.0.0", # for rvm::system
        user_default_ruby: "2.0.0", # for rvm::user
        user_installs: [
          {
            user: "hongchao.liu"
          }
        ]
      },
      system_packages: {
        packages: "imagemagick libmagickwand-dev ranger tmux emacs vim" # "build-essential git zsh" already in ohmyzsh
      }
    }
  end
end


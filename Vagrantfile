Vagrant.configure("2") do |config|
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "ubuntu/jammy64"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip: "192.168.56.10"

    jenkins.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end

    jenkins.vm.provision "shell", path: "vagrant/scripts/setup-jenkins.sh"
  end

  config.vm.define "prod" do |prod|
    prod.vm.box = "ubuntu/jammy64"
    prod.vm.hostname = "prod"
    prod.vm.network "private_network", ip: "192.168.56.20"
    prod.vm.network "forwarded_port", guest: 3000, host: 3000

    prod.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.cpus = 1
    end

    # Disponibiliza a aplicação no servidor de produção.
    prod.vm.synced_folder "app", "/opt/app"
    prod.vm.provision "shell", path: "vagrant/scripts/setup-prod.sh"
  end
end

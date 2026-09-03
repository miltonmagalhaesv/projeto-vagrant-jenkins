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
end

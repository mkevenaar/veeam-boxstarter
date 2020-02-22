Vagrant.configure("2") do |config|

  config.vm.define "veeamboxstarter" do |veeamboxstarter|
    veeamboxstarter.vm.box = "StefanScherer/windows_2016"
    veeamboxstarter.windows.halt_timeout = 20
    veeamboxstarter.winrm.username = "vagrant"
    veeamboxstarter.winrm.password = "vagrant"
    veeamboxstarter.vm.guest = :windows
    veeamboxstarter.vm.communicator = "winrm"

    veeamboxstarter.vm.network :forwarded_port, guest: 5985, host: 14985, id: "winrm", auto_correct: true
    veeamboxstarter.vm.network :forwarded_port, guest: 3389, host: 14389, id: "rdp", auto_correct: true
    veeamboxstarter.vm.network :forwarded_port, guest: 22, host: 14222, id: "ssh", auto_correct: true

    veeamboxstarter.vm.provider :virtualbox do |v, override|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.gui = true
      v.customize ["modifyvm", :id, "--memory", "8192"]
      v.customize ["modifyvm", :id, "--vram", 32]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--audio", "none"]
      v.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      v.customize ["modifyvm", :id, "--draganddrop", "hosttoguest"]
      v.customize ["modifyvm", :id, "--usb", "off"]
      # linked clones for speed and size
      v.linked_clone = true if Vagrant::VERSION >= '1.8.0'
    end

    veeamboxstarter.vm.provision :shell, :path => "shell/PrepareWindows.ps1", privileged: false
    veeamboxstarter.vm.provision :shell, :path => "shell/SetWindowsPreferences.ps1", privileged: false
    veeamboxstarter.vm.provision :shell, :path => "shell/InstallChocolatey.ps1", privileged: false
    veeamboxstarter.vm.provision :shell, :path => "shell/NotifyGuiAppsOfEnvironmentChanges.ps1", privileged: false
  end
end

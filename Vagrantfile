Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  # we're opening 3000, 8000, and 8080 because they're the most
  # likely to be used during your webdev process.
  #
  # if you need more ports, copy paste the examples and change the numbers
  config.vm.network "forwarded_port", guest:3000, host:3000
  config.vm.network "forwarded_port", guest:5432, host:5432
  config.vm.network "forwarded_port", guest:8000, host:8000
  config.vm.network "forwarded_port", guest:8080, host:8080
  config.vm.network "forwarded_port", guest:27017, host:27017
  config.vm.provision :shell, path: "bootstrap.sh"
end


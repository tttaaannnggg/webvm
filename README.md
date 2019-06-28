# IMMA FIX IT!
For you poor souls who are stuck on Windows or a super old Mac Mini, or otherwise are struggling with getting your environment set up, I've made you an Ubuntu 18.04 image with most of the goodies built in!

This installation includes the following:
* NodeJS
* NPM
* NVM
* PostgreSQL
* MongoDB

(note: this is done with minimal configuration, so you may need to do more work to get it going for your particular use case. The installations are valid, though.)

I'm planning to add the following as I continue to build up the box, but haven't installed them yet:
* Docker
* Kubernetes
* (some CLI utils?)
* (my own .vimrc?)

# What is this?
A VM (Virtual Machine) is a way to use resources from your computer as a mini-computer. You can imagine dedicating some portion of the CPU/RAM/HDD on your machine to run as if it were a separate machine. This has myriad benefits and a variety of applications across the world of software engineering.

In this case, we've got a little VM that runs Ubuntu 18.04, one of the most common Linux distributions out there.

A few of these benefits:
* **security** - if you're not sure if an app is unsafe, you can run it in a VM so that if it screws anything up, it'll just break the emulated computer, and not spread to the rest of your machine
* **compatibility** - this is the main reason for creating this repo; People develop on different machines, and some of them are pretty screwed up. Older Mac Minis won't support the newest version of NodeJS. The Windows filesystem syntax is a little different than UNIX, which screws up filesystem operations. Setting up a local database on Windows can also be a big pain.
* **configuration** - I can give you a completely independent, pre-configured machine, so we don't have to fuss about whether we have the right environment set up. Sometimes you start messing with your registry, or other files to get a very specific program to work, but don't realize it breaks other software on your machine, at which point it becomes a nightmare to debug. It's also a nice perk if you're working on multiple machines and want to have things consistent across all of them.
* **distributed computing** - We can actually run multiple VMs on one machine, enabling us to emulate a cluster, or just horizontally scale our app by spinning up more instances of the same thing.
* **easy recovery** - If the machine gets trashed, you can easily rebuild it from an image, minimizing your setup hassles.

# Installation

1. Install [Vagrant](https://www.vagrantup.com/)
2. Install [Virtualbox](https://www.virtualbox.org/) (If you're on Mojave, you may need to install [VirtualBox 5.2](https://www.virtualbox.org/wiki/Download_Old_Builds_5_2))
3. clone down this repo `git clone https://github.com/tttaaannnggg/webvm.git`

# Usage
1. enter the `webvm` folder that you cloned down from this repo
2. if you're in the folder with the `Vagrantfile`, `vagrant up` will initialize your VM, which will take a while the first time you run it. You'll see a bunch of stuff printed to the conosle.
3. once the previous operation is done, run `vagrant ssh`, and you'll be presented with a terminal. it should print something like `Wecome to Ubuntu 18.04`, and change your prompt to `vagrant@ubuntu-bionic`

### Accessing your files
There is a specific folder that is shared between the guest (virtual) OS, and the host (main) OS. On the host OS, you simply need to go to the `webvm` folder, and you'll see the shared stuff. On the VM, you'll be able to access the same folder at `/vagrant/` (i.e. `cd /vagrant/`)

### Suggested Workflow
The workflow I propose is something like this:
1. start your VM with `vagrant up`
2. put your projects in the `webvm` folder
3. when you're ready to run your project, run `vagrant ssh`
4. inside of your VM, `cd /vagrant`
5. `cd` into your project folder and run it as desired
6. when you're done, run `sudo shutdown -h now` to kill your running VM

**TL;DR**: do all your editing on your host OS, but run stuff within the VM for that sweet, sweet compatibility

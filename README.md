## This repo contains sample how to run locally a custom plugin to get an external IP as data source.

### Requirments

1. [Vagrant](https://www.vagrantup.com/) installed - it's needed since plugin will be compiled in the VM.
2. A basic knowledge about [Terraform](https://www.terraform.io/).
### More info could be found on following repo:

[terraform-provider-extip](https://github.com/petems/terraform-provider-extip)
### Usage:

1. Clone the repo.
```
git clone https://github.com/chavo1/tf-provider-extip.git
```
2. Then:
```
vagrant up
vagrant ssh
```
3.  Excute a following commands to build the plugin:
```
# vagrant ssh  
# go get github.com/petems/terraform-provider-extip  
# cd ~/go/src/github.com/petems/terraform-provider-extip  
# make build  
# ls -al ~/go/bin/
```
4. Copy created plugin into vagrant directory(which is shared between your machine and VM):
```
# mkdir -p /vagrant/terraform.d/plugins/linux_amd64
# cp ~/go/bin/terraform-provider-extip /vagrant/terraform.d/plugins/linux_amd64/
```
5. Test that it works:
```
# terraform init  
# terraform apply
```

## This repo contains sample how to run locally a custom plugin to get an external IP as data source.

### Requirments

1. [Vagrant](https://www.vagrantup.com/) installed - it's needed since plugin will be compiled in the VM.
2. [Virtual Box](https://www.virtualbox.org/) installed.
3. A basic knowledge about [Terraform](https://www.terraform.io/).
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
# cd /vagrant
```
5. Test that it works:
```
# terraform init  
# terraform apply
```
6. The output should be as follow:
```
vagrant@xenial64:/vagrant$ terraform apply
data.extip.external_ip: Refreshing state...

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

external_ip = X.X.X.X
```
## To test with kitchen execute a following command:

```
kitchen test
```

The output should be:

```
✔  check_string: X.X.X.X
     ✔  X.X.X.X should not eq "nil"
     ✔  X.X.X.X should not eq ""
     ✔  X.X.X.X should not eq "default_value"


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 3 successful, 0 failures, 0 skipped
```
- X.X.X.X - is a placeholder of current external IP address.

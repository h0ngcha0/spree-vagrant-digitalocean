spree-vagrant
=============

vagrant repo for spree developmemt

After installing vagrant and chef, run the following commands:

```shell
git submodule update --init
vagrant up
```

After the VM is up and running, run:

```shell
vagrant ssh
```

to ssh to the VM and install rails:

```shell
gem install rails -v 4.0.0
gem install therubyracer
```

# Vagrant - YAML Configuration File to build environments

Simple translation of Vagrantfile into YAML configuration file.
The goal is to set up the environment with VirtualBox and Vagrant, quickly and easily using the YAML markup facility.

## Quick start

1. Ensure VirtualBox and Vagrant is installed;
2. Ensure that the Vagrant plugin Landrush installed;
3. Clone this repository;
4. Edit the environment.yaml with machines you need; and
5. Run 'vagrant up' to up all machines of the environment;

## YAML Configuration File

The Vagrantfile read the environment.yaml to up all machines of the environment.
Following the example configuration file:

```yaml
global:
  linked_clone: true
  landrush: true
  domain: lab.com.br
  network_prefix: 192.168.200
  memory: 1024
  cpus: 1
  box: centos/7

hosts:
  - hostname: infra01
    box: centos/7
    memory: 512
    cpus: 1

  - hostname: infra02
    box: centos/7
    memory: 512
    cpus: 1

  - hostname: master01
    box: centos/7
    hostname: master01.4linux.com.br
    memory: 1024
    cpus: 1

  - hostname: master02
    box: centos/7
    hostname: master02.4linux.com.br
    memory: 1024
    cpus: 1

  - hostname: node01
    box: centos/7
    memory: 512
    cpus: 1

  - hostname: node02
    box: centos/7
    memory: 512
    cpus: 1

  - hostname: node03
    box: centos/7
    memory: 512
    cpus: 1
```

Basically this configuration provision seven machines with operating system CentOS 7.
Inside in this directory enough run 'vagrant up'.
The following directives is possible:

### Global settings

- linked_clone: if linked clone is activated;
- landrush: if landrush plugin is activated;
- domain: the domain name of environment;
- network_prefix: the prefix to private network. Internaly is set a sequence 10 + 1;
- memory: the size of memory RAM for all machines, if not set in local hosts configuration; and
- cpus: the number of cores CPU for all machines, if not set in local host configuration;

### Local hosts settings

- box: the operating system for all machines, if not set in local host configuration;
- hostname: the name of machine in virtualbox;
- box: the operating system how vagrant box to download;
- memory: the size of memory RAM of machine;
- cpus: the number of cores CPU; and
- provision: the provisioner (only ansible for a while);

## To do

- Provision with Puppet and Shell;
# Vagrant - YAML Configuration File to build environments

Simple translation of Vagrantfile into YAML configuration file.
The goal is to set up the environment with VirtualBox and Vagrant, quickly and easily using the YAML markup facility.

## Quick start

1. Ensure VirtualBox and Vagrant installed;
2. Clone this repository;
3. Edit the environment.yaml with machines you need; and
4. Run 'vagrant up' to up all machines of the environment;

## YAML Configuration File
The Vagrantfile read the environment.yaml to up all machines of the environment.
Following the example configuration file:
```yaml
- name: infra01
  box: centos/7
  hostname: infra01.4linux.com.br
  ipaddress: 192.168.200.10
  memory: 512
  cpus: 1

- name: infra02
  box: centos/7
  hostname: infra02.4linux.com.br
  ipaddress: 192.168.200.20
  memory: 512
  cpus: 1

- name: master01
  box: centos/7
  hostname: master01.4linux.com.br
  ipaddress: 192.168.200.30
  memory: 1024
  cpus: 1

- name: master02
  box: centos/7
  hostname: master02.4linux.com.br
  ipaddress: 192.168.200.40
  memory: 1024
  cpus: 1

- name: node01
  box: centos/7
  hostname: node01.4linux.com.br
  ipaddress: 192.168.200.50
  memory: 512
  cpus: 1

- name: node02
  box: centos/7
  hostname: node02.4linux.com.br
  ipaddress: 192.168.200.60
  memory: 512
  cpus: 1

- name: node03
  box: centos/7
  hostname: node03.4linux.com.br
  ipaddress: 192.168.200.70
  memory: 512
  cpus: 1
```

Basically this configuration provision seven machines with operating system CentOS 7.
Inside in this directory enough run 'vagrant up'.
The following directives is possible:
- name: the name of machine in virtualbox;
- box: the operating system how vagrant box to download;
- hostname: the hostname of machine;
- ipaddress: the ip address of the Vagrant network Host-Only;
- memory: the size of memory RAM of machine; and
- cpus: the number of cores CPU;

## To do
- Provision with Puppet, Ansible or Shell;
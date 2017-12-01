# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = 2
AVAILABLE_PLUGINS = ['landrush', 'hostmanager']

require 'yaml'

env = YAML.load_file('env.yaml')
global = env['global']
machines = env['machines']
prefix = global['network_prefix']

Vagrant.require_version '>= 2.0.0'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  if Vagrant.has_plugin?('hostmanager') && global['hostmanager']
    config.hostmanager.enabled           = true
    config.hostmanager.manage_host       = true
    config.hostmanager.ignore_private_ip = false
  end
  if Vagrant.has_plugin?('landrush') && global['landrush']
    config.landrush.enabled = true
    config.landrush.tld = global['domain']
    config.landrush.guest_redirect_dns = false
  end

  machines.each_with_index do |m, index|
    config.vm.define m['hostname'] do |d|
      if m['box']
        d.vm.box = m['box']
      else
        d.vm.box = global['box']
      end
      d.vm.hostname = m['hostname']
      d.vm.network 'private_network', ip: "#{prefix}.#{index + 10}"
      d.vm.provider 'virtualbox' do |vb|
        vb.name = m['hostname']
        if m['memory'] && m['cpus']
          vb.memory = m['memory']
          vb.cpus   = m['cpus']
        else
          vb.memory = global['memory']
          vb.cpus = global['cpus']
        end
        vb.linked_clone = true if global['linked_clone']
      end
      if m['provision']['ansible']
        d.vm.provision :ansible_local do |ansible|
          ansible.playbook = m['ansible']['playbook']
          ansible.become = true
          ansible.become_user = 'root'
          ansible.inventory_path = m['ansible']['inventory']
        end
      end
    end
  end
end

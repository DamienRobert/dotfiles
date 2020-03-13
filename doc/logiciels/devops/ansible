vim: ft=markdownlight fdm=expr

Ansible
=======

Options
-------
-v: verbose
-m: module
-a: argument to the module
-f lvl: level of parallelism (default to 5)
-i: path to the inventory file

Ex from http://docs.ansible.com/guide_vagrant.html
$ ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=~/.vagrant.d/insecure_private_key -u vagrant playbook.yml

Patterns
--------

all: everyone
group1:group2:!group3 -> group1 and group2 minus group3
webservers:&staging -> intersection
See http://docs.ansible.com/intro_patterns.html for more complicated examples

While we’re jumping a bit ahead, additionally, you can add an exclusion
criteria just by supplying the --limit flag to /usr/bin/ansible or
/usr/bin/ansible-playbook:
$ ansible-playbook site.yml --limit datacenter2

Modules
-------

See: http://docs.ansible.com/intro_adhoc.html

# default module: command
ansible all -a "/sbin/reboot" -f 10 -u username --sudo
[--ask-sudo-pass] [--sudo-user othername]

# ping:
ansible all -m ping

# shell
ansible all -m shell -a 'echo $TERM'

# Raw action
ansible -v all -m raw -a 'ln -snf /run/systemd/resolve/resolv.conf /etc/resolv.conf; /usr/bin/pacman -S --noconfirm python2' --sudo

# File Copy and Settings
ansible atlanta -m copy -a "src=/etc/hosts dest=/tmp/hosts mode=644"
ansible webservers -m file -a "dest=/srv/foo/b.txt mode=600 owner=mdehaan group=mdehaan state=directory"

# Users
$ ansible all -m user -a "name=foo password=<crypted password here>"
$ ansible all -m user -a "name=foo state=absent"

# Vcs
$ ansible webservers -m git -a "repo=git://foo.example.org/repo.git dest=/srv/myapp version=HEAD"

# Services
$ ansible webservers -m service -a "name=httpd state=started"
state=started/restarted/stopped

# See ansible variables

ansible all -m setup

Configuration
-------------

http://docs.ansible.com/intro_configuration.html

hostfile = /etc/ansible/hosts
log_path=/var/log/ansible.log
hosts=* #This is the default group of hosts to talk to in a playbook if no “hosts:” stanza is supplied. The default is to talk to all hosts. You may wish to change this to protect yourself from surprises: Note that /usr/bin/ansible always requires a host pattern and does not use this setting, only /usr/bin/ansible-playbook.
remote_user = root #This is the default username ansible will connect as for /usr/bin/ansible-playbook. Note that /usr/bin/ansible will always default to the current user if this is not defined:
roles_path = /opt/mysite/roles #The roles path indicate additional directories beyond the ‘roles/’ subdirectory of a playbook project to search to find Ansible roles

Ansible-Playbook
================

http://docs.ansible.com/playbooks_intro.html

(Ansible-Pull
Should you want to invert the architecture of Ansible, so that nodes check in to a central location, instead of pushing configuration out to them, you can.
See ansible-pull --help)

One play:
--------
ansible-playbook playbook.yml -f 10

---
- hosts: webservers
  vars:
    http_port: 80
    max_clients: 200
  remote_user: root
  tasks:
  - name: ensure apache is at the latest version
    yum: pkg=httpd state=latest
  - name: write the apache config file
    template: src=/srv/httpd.j2 dest=/etc/httpd.conf
    notify:
    - restart apache
  - name: ensure apache is running
    service: name=httpd state=started
  - name: disable selinux
    command: /sbin/setenforce 0
  handlers:
    - name: restart apache
      service: name=httpd state=restarted

# http://docs.ansible.com/playbooks_roles.html (Include/Roles)

Include
-------

3 ways to pass variables (along with the global vars: setting)

tasks:
  - include: wordpress.yml user=timmy
  - include: wordpress.yml user=alice
  - include: wordpress.yml user=bob

tasks:
 - { include: wordpress.yml, user: timmy, ssh_keys: [ 'keys/one.txt', 'keys/two.txt' ] }

tasks:
  - include: wordpress.yml
    vars:
        remote_user: timmy
        some_list_variable:
          - alpha
          - beta
          - gamma

Using the variable: {{ user }}

Roles
-----

site.yml
roles/
   common/
     files/
     templates/
     tasks/
     handlers/
     vars/
     defaults/
     meta/

This designates the following behaviors, for each role ‘x’:
  - If roles/x/tasks/main.yml exists, tasks listed therein will be added to the play
  - If roles/x/handlers/main.yml exists, handlers listed therein will be added to the play
  - If roles/x/vars/main.yml exists, variables listed therein will be added to the play
  - If roles/x/meta/main.yml exists, any role dependencies listed therein will be added to the list of roles (1.3 and later)
  - Any copy tasks can reference files in roles/x/files/ without having to path them relatively or absolutely
  - Any script tasks can reference scripts in roles/x/files/ without having to path them relatively or absolutely
  - Any template tasks can reference files in roles/x/templates/ without having to path them relatively or absolutely
  - Any include tasks can reference files in roles/x/tasks/ without having to path them relatively or absolutely
+ roles/x/defaults/main.yml can define 'defaults variables' which will be
overridden by everything else

Parametrizing roles:
- hosts: webservers
  roles:
    - common
    - { role: foo_app_instance, dir: '/opt/a',  port: 5000 }
    - { role: foo_app_instance, dir: '/opt/b',  port: 5001 }
- hosts: webservers
  roles:
    - { role: some_role, when: "ansible_os_family == 'RedHat'" }
- hosts: webservers
  roles:
    - { role: foo, tags: ["bar", "baz"] }

- hosts: webservers

Pre/Post taks
  pre_tasks:
    - shell: echo 'hello'
  roles:
    - { role: some_role }
  tasks:
    - shell: echo 'still busy'
  post_tasks:
    - shell: echo 'goodbye'

Role Dependencies
Role dependencies are stored in the meta/main.yml file contained within the role directory.
---
dependencies:
  - { role: common, some_parameter: 3 }
  - { role: apache, port: 80 }
  - { role: postgres, dbname: blarg, other_parameter: 12 }

Variables
---------

Precedence for the variables:
* -e variables always win
* then comes "most everything else"
* then comes variables defined in inventory
* then comes facts discovered about a system
* then "role defaults", which are the most "defaulty" and lose in priority to everything.
See also: http://jpmens.net/2012/08/30/ansible-variables-variables-and-more-variables/

See also
http://docs.ansible.com/playbooks_variables.html#information-discovered-from-systems-facts
for variables obtained via the setup module and how to have local variables
in the node

When
----
http://docs.ansible.com/playbooks_conditionals.html

vars:
  epic: true
tasks:
    - shell: echo "This certainly is epic!"
      when: epic
tasks:
    - shell: echo "This certainly isn't epic!"
      when: not epic

tasks:
  - command: /bin/false
    register: result
    ignore_errors: True
  - command: /bin/something
    when: result|failed
  - command: /bin/something_else
    when: result|success
  - command: /bin/still/something_else
    when: result|skipped

- include: tasks/sometasks.yml
  when: "'reticulating splines' in output"
- hosts: webservers
  roles:
     - { role: debian_stock_config, when: ansible_os_family == 'Debian' }

http://docs.ansible.com/playbooks_variables.html#magic-variables-and-how-to-access-information-about-other-hosts
Ex: when: "'mail' in inventory_hostname"
    when: "'webserver' in group_names"

See also https://groups.google.com/forum/#!topic/ansible-project/T8SbvCW_Z0Y
using group_by to define hosts based on a variables to conditionally apply
a role
- name: "define a subgroup based on a variable"
  hosts: all
  tasks:
    - group_by: key=has_foo
      when: foo
- name: "run subgroup tasks"
  hosts: has_foo
  tasks:
     - shell: echo "I have foo!"

https://groups.google.com/forum/#!msg/ansible-project/ISUrFSLlNA8/DuBexImV_iUJ
- name: run this command if this file doesn't already exist
  action: shell /srv/dbsetup.sh foo bar baz creates=/srv/path/to/database

Loops
-----

http://docs.ansible.com/playbooks_loops.html

- name: add several users
  user: name={{ item }} state=present groups=wheel
  with_items:
     - testuser1
     - testuser2
- name: add several users
  user: name={{ item.name }} state=present groups={{ item.groups }}
  with_items:
    - { name: 'testuser1', groups: 'wheel' }
    - { name: 'testuser2', groups: 'root' }
--- vars/main.yaml
users:
  alice:
    name: Alice Appleworth
    telephone: 123-456-7890
  bob:
    name: Bob Bananarama
    telephone: 987-654-3210

tasks:
  - name: Print phone records
    debug: msg="User {{ item.key }} is {{ item.value.name }} ({{ item.value.telephone }})"
    with_dict: users

# More doc:
http://docs.ansible.com/playbooks_best_practices.html
ansible-playbook -i production site.yml #use inventory production
ansible-playbook -i production site.yml --tags ntp
ansible-playbook -i production webservers.yml --limit boston[0-10]
ansible boston -i production -m ping
ansible boston -i production -m command -a '/sbin/reboot'

Variables: http://docs.ansible.com/playbooks_variables.html
Tags: http://docs.ansible.com/playbooks_tags.html
Vagrant: http://docs.ansible.com/guide_vagrant.html
Dynamic inventories: http://docs.ansible.com/developing_inventory.html

http://docs.ansible.com/playbooks_delegation.html
  - name: recursively copy files from management server to target
    local_action: command rsync -a /path/to/files {{ inventory_hostname }}:/path/to/target/

#A commented playbook
https://gist.github.com/marktheunissen/2979474

#list of playbooks
https://github.com/ansible/ansible-examples
cf language_features
- https://github.com/elasticdog/monarch
  Ansible playbooks for configuring your own mail server on Arch Linux

#Modules in ruby
https://github.com/ansible/ansible-for-rubyists

#Defining the user
http://stackoverflow.com/questions/24095807/ansible-get-the-username-from-the-command-line

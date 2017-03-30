# terraform-infra-template
based template for aws
=======

This folder contains code/automation that sets up the network, firewall, servers. It also contains code for setting up the

Structure
-------

* Terraform scripts follow best practices set out by Hashicorp [Terraform BestPractices](https://github.com/hashicorp/best-practices/tree/master/setup)
* Ansible scripts follow best practices set out[Ansible BestPractices](http://docs.ansible.com/playbooks_best_practices.html)
````
The structure of this repository is laid out as follows.

├── 01-terraform            # <-- All infrastructure on cloud services are done throught Terraform scripts
│   ├── aws                 # <-- AWS infrastructure
│   ├── bin                 # <-- Terraform Binaries
│   ├── init_script         # <-- Some services started up by the estate.
│   └── modules             # <-- Following Terraform best practice - standardize modules installation.
│   └── policies            # <-- AWS Policy templates (IAM templates)
│   └── scripts             # <-- Global scripts for cretaing and destroying the entire estate.
│   └── user_data           # <-- This contain scripts for cloud init. This should not be used in future.
├── 02-ansible              # <-- All Ansible code related to dfeployments and service installation.
│   ├── host/               # <-- Needs to be removed
│   ├── inventory/          # <-- Should contain all host record references and variables.
│   ├── plugins/            # <-- contains hooks to cloud services
│   ├── products/           # <-- This contains all service definitions.
│   └── roles/              # <-- This contains setup scripts for different components.
│   └── test/               # <-- This contains the test for each product.
├── 03-dev/                 # <-- Localhost Dev enviroment setup


````

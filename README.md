[![Run Status](https://api.shippable.com/projects/591c82a22f895107009e8b35/badge?branch=devel)](https://app.shippable.com/github/ansible/awx)

AWX
===

AWX provides a web-based user interface, REST API, and task engine built on top of [Ansible](https://github.com/ansible/ansible). It is the upstream project for [Tower](https://www.ansible.com/tower), a commercial derivative of AWX.  

To install AWX, please view the [Install guide](./INSTALL.md).

To learn more about using AWX, and Tower, view the [Tower docs site](http://docs.ansible.com/ansible-tower/index.html).

The AWX Project Frequently Asked Questions can be found [here](https://www.ansible.com/awx-project-faq).

# Table of Contents:
   * [AWX](#awx)
   * [Notes](#notes)
   * [Setup and installation](#setup-and-installation)

---

# Notes:
* This repo was forked from the official [AWX repo](https://github.com/ansible/awx).
* This was to customize the contents.  Please refer to the official documentation otherwise.
* This expects External-DNS to be installed to your cluster.  You can figure this on k8s and AWS via the [external-dns repo](https://github.com/kubernetes-incubator/external-dns).

---

# Setup and installation:
* Edit the namespace and context for kubernetes / helm in `installer/inventory`
* Install pip modules:
  `pip install -r requirements.txt`
* Setup PostgreSQL:
  * We use the helm chart from [Charts/postgresql](https://github.com/kubernetes/charts/tree/master/stable/postgresql).
  * Edit the following values in the `values.yaml` file:
```
 20 ## Default: postgres
 21 postgresUser: admin
 22 ## Default: random 10 character string
 23 postgresPassword: abc123
```

  * Now update your `./installer/inventory` postgres paramters to reflect whatever you put in above:
```
 60 # Set pg_hostname if you have an external postgres server, otherwise
 61 # a new postgres service will be created
 62 pg_hostname=postgres-postgresql.default.svc.cluster.local
 63 pg_username=admin
 64 pg_password=abc123
 65 pg_database=awx
 66 pg_port=5432
```

  * Now install postgres:

  `helm install --name postgres stable/postgresql -f values.yaml`

* Run:
  `ansible-playbook -i inventory install.yml`

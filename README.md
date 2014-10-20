blacklight vagrant
==================
A vagrant developer environment for [project blacklight](http://projectblacklight.org/).


building the environment
------------------------
1. clone the repository
1. navigate to the cloned directory
1. `vagrant up`


initial seeding
---------------
There seems to be an issue with the initial seeding of solr so it needs to be done manually until the issue is resolved.

1. `vagrant up` # if not already up
1. `vagrant ssh`
1. `cd /vagrant/blacklight/`
1. `rake jetty:start`
1. `rake blacklight:solr:seed`
1. continue to step 5 under starting the application


starting the application
------------------------
After the initial seeding, this is the regular startup method.

1. `vagrant up` # if not already up
1. `vagrant ssh`
1. `cd /vagrant/blacklight/`
1. `rake jetty:start`
1. `rails s`
1. in a browser navigate to http://localhost:3000


see also
--------
* [why vagrant](https://docs.vagrantup.com/v2/why-vagrant/index.html)
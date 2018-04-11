.. ===============LICENSE_START=======================================================
.. Acumos CC-BY-4.0
.. ===================================================================================
.. Copyright (C) 2017-2018 AT&T Intellectual Property & Tech Mahindra. All rights reserved.
.. ===================================================================================
.. This Acumos documentation file is distributed by AT&T and Tech Mahindra
.. under the Creative Commons Attribution 4.0 International License (the "License");
.. you may not use this file except in compliance with the License.
.. You may obtain a copy of the License at
..
.. http://creativecommons.org/licenses/by/4.0
..
.. This file is distributed on an "AS IS" BASIS,
.. See the License for the specific language governing permissions and
.. limitations under the License.
.. ===============LICENSE_END=========================================================

===========================
One Click Deploy User Guide
===========================

Introduction
============

This user guide describes how to deploy Acumos platforms using the
"One Click deploy" tools designed for developers or those who want a simple and
automated way to deploy an all-in-one (AIO) Acumos platform.

What is an AIO deploy?
----------------------

The AIO deploy tools build an all-in-one instance of Acumos, with the database,
Nexus repositories and docker containers all running on a single virtual
machine or physical host machine.

What's included in the AIO tools
--------------------------------

* oneclick_deploy.sh: the main script that kicks off the deployment, run
  as “bash oneclick_deploy.sh”.
* acumos-env.sh: environment setup script that is customized as new
  environment parameters get generated (e.g. passwords). Used by various
  scripts in this toolset, to set shell environment variables that they need.
  Post-install, you can get various passwords from this e.g. mysql root and user
  passwords if you want to do any manual database operations, e.g. see what
  tables/rows are created as part of Acumos deployment.
* clean.sh: script you can run as “bash clean.sh” to remove the Acumos install,
  to try it again etc.
* cmn-data-svc-ddl-dml-mysql-1.14.sql: Common Dataservice database setup script.
  Used by onelick_deploy.sh. Will be updated as the common-dataservice used by
  these tools is upgraded.
* openssl.cnf: OpenSSL configuration file used in self-signed certificate
  generation.
* docker-compose.sh: Script called by the other scripts as needed, to take
  actions on the set of Acumos docker services. Used by oneclick_deploy.sh and
  clean.sh. You can also call this directly e.g. to tail the service container
  logs. See the script for details.
* docker-compose.yaml: The docker services that will be acted upon, per the
  options passed to docker-compose.sh.
* peer-test.sh: Automated deployment of two AIO platforms, with federation and
  demo model onboarding. Used to test federation use cases.
* create-peer.sh: Automated setup of a peer relationship between two Acumos
  AIO deployments. Used by peer-test.sh.
* create-user.sh: Automated user provisioning and role assignment. Used by
  peer-test.sh to create users for model onboarding, and portal admins for
  testing federation actions on the Acumos platform.
* bootstrap-models.sh: Model package onboarding via curl. Optionally called by
  peer-test.sh.

Step-by-Step Guide
==================

Prerequisites
-------------

This guide assumes:

* you are deploying all Acumos platform components on an Ubuntu 16.04.x
  desktop/server, with at least 16GB of RAM (recommended). The Acumos platform
  as deployed by this script on bare metal consumes currently about 6GB of RAM,
  so may be deployable in hosts with less than 16GB RAM.
* you are deploying an AIO instance to a host that:
 * has a hostname resolvable by DNS or through the hosts file of whatever
   machine you use to interact the Acumos web portal (referred to here as the
   "portal") and platform APIs such as onboarding and federation.
* Note the target host can be another physical host, or a VM running on your
  workstation, and that for the purpose of the examples in this guide the
  hostname is assumed to be "acumos".
* You have full access to the target host, i.e. all ports are accessible.

Install Process
---------------

The notes below provide an overview of the default installation process. Note
these scripts are a work in progress, and not all Acumos platform functions may
work correctly at this time. See "Verified Features" below for a summary of
what's been verified to work, at least in the test environments where this has
been used so far.

* Open a shell session (bash recommended) on the host where you want to install
  Acumos, and clone the system-integration repo:
 * git clone https://gerrit.acumos.org/r/system-integration

* In the system-integration/AIO folder, run the following command:
 * bash oneclick_deploy.sh
 * The deployment will take 5-20 minutes depending upon whether you have run
   this command before, and thus docker has already downloaded the Acumos docker
   images. That will speed up subsequent re-deploys.

* When the deployment is complete, you will need to complete one Hippo CMS
  setup step manually, so that all Acumos portal content is displayed
  correctly. This will be automated asap, but for now follow these steps:
 * In your browser goto the Hippo CMS component at http://acumos:9080 and
   login as "admin/admin"
 * Browse to http://acumos:9080/cms/console (there's no direct link from the
   CMS home screen)
 * One the left, click the + at "hst:hst" and then also at "hst:hosts"
 * Click the + at the "dev-env" entry, and the same for the nodes as they
   appear: "com", "azure", "cloudapp", "eastus"
 * Right-click on the "acumos-dev1-vm01-core" entry and select "Move node".
   In the "Move Node" dialog, select the "dev-env" node, enter "acumos" at "To",
   and click "OK"
 * With the "acumos" node selected, click "Add Property" from the toolbar,
   select "hst:schemeagnostic", click "OK", and click the check box under the
   new attribute.
 * Select the "dev-env" node, and replace
   "acumos-dev1-vm01-core.eastus.cloudapp.azure.com" with "acumos".
 * Right-click the "com" node above (now superfluous), select "Delete node", and
   "OK"
 * On the upper right, select the "Write changes to repository" button and "OK"

* So that the default portal domain name "acumos" will resolve on your
  workstation (from which you will access the portal via your browser), add the
  following line to your workstation's hosts file:
 * "\<ip address of your AIO host\> acumos"

* You should now be able to browse to https://acumos, and
 * register new user accounts, etc
 * If you get a browser warning, just accept the self-signed cert and proceed.
  * Note: use of the Chrome browser is recommended, as it puts fewer
    roadblocks to accessing sites with self-signed certs.

Stopping, Restarting, and Reinstalling
--------------------------------------

You can stop all the Acumos components (e.g. to suspend/shutdown your host)
without losing their databases via the command:

* sudo bash docker-compose.sh stop

Restart the services later using the following command (note it may take a few
minutes for all to be active):

* sudo bash docker-compose.sh restart

You can clean the installation (including all data) and optionally reinstall
using the sequence below:

* bash clean.sh
* bash oneclick_deploy.sh

Verified Features
-----------------

The following Acumos platform workflows and related features have been verified as
working so far. This list will be updated as more workflows are verified.

* new user registration and login
* portal web page asset integration through Hippo CMS (e.g. user guides under
  "On-Boarding Model")
* model onboarding via command line (scikit-learn, python/tensorflow)
* federated peer relationship creation via portal
* model publication to local marketplace
* model publication to federated marketplace
* federated subscription to public marketplace models

Notes on Verified Features
--------------------------

User registration and login
...........................

Currently there is no default user with the "admin" role, as needed e.g. to
setup federation (see below). A test script to automate user account creation
and role assignment has been included in this repo. See create-user.sh for info
and usage. For an example of this script in use, see peer-test.sh below.

Model onboarding via command line
.................................

Currently this is verified by posting a model package to the onboarding API,
as toolkit clients will do when installed. A script and set of sample models to
automate this are in development, and will be added to Acumos repos soon.

Federation
..........

oneclick_deploy.sh will automatically create a "self" peer as required by the
federation-gateway.

If you want to deploy two Acumos AIO instances to test federation, see these
scripts for info and usage:

* peer-test.sh: installs and peers two Acumos AIO instances, on two hosts, and
  optionally uploads model packages via curl.

* create-peer.sh: used by peer-test.sh. You can call this script directly to
  add a peer to an existing Acumos platform.

You can also manually create a federated peer:

* If you have not created an admin user, run create-user.sh as above to create
  one.
* Login to the portal as the admin user
* Under the "SITE ADMIN" page, select "Add Peer", enter these values, and select
  "Done":
 * Peer Name: FQDN of the peer
 * Server FQDN: DNS-resolvable FQDN of the peer
 * API Url: http://\<FQDN of the peer\>:\<federation-gateway port from
   acumos-env.sh\>
 * Peer Admin Email: any valid email address

* Verify that the peer relationship was setup via executing these commands on
  the AIO host
 * source acumos-env.sh
 * curl -vk --cert certs/acumos.crt --key certs/acumos.key <API Url as above>

* You should see details of the HTTPS connection followed by
 * {"error":null,"message":"available public solution for given filter",
   "content":[...]}

* This indicates that the request for "solutions" was accepted. "..." will
  either be "" (no solutions) or a JSON blob with the solution details.

Features Pending Verification
-----------------------------

* model onboarding via web
* model private sharing with user
* model launch
* design studio

Additional Notes
================

The scripts etc in this repo install Acumos with a default set of values for
key environment variables. See acumos-env.sh for these defaults. You should be
able to modify any explicit value (not variables) defined there, but some
additional steps may be needed for the installed platform to work with the
updated values. For example:

* To use a non-default domain name for the acumos AIO server
  (default: acumos), change ACUMOS_DOMAIN in acumos-env.sh, and use the chosen
  domain name in the "Install Process" above, in place of "acumos".

* You can install multiple Acumos platforms (e.g. to test federation), just be
  sure to give each a unique domain name as above.

* The Hippo CMS manual config process above can also work for any FQDN, with
  the changes:
 * Under "hst:hosts", replace the host domain name elements at each level in
   the domain name, with the corresponding level name for your chosen FQDN,
   and move/rename the "acumos-dev1-vm01-core" by selecting to the
   next-to-last level (e.g. "example", if your FQDN is "acumos.example.com"),
   and naming the node as the last subdomain name (e.g. "acumos", if your FQDN
   is "acumos.example.com")

* The latest verified Acumos platform docker images are specified in
  acumos-env.sh. This script will be updated as new versions are released to
  the staging or release registries of the Acumos.org nexus server.

* As of this version, only a clean install is supported by this script, thus
  for each re-install you will need to recreate users, re-onboard models, etc.
  Test scripts to simplify this process will be provided asap.

This is an early version of this script. Various workarounds and incompletely
verified functions may be included.

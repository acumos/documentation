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
.. WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
.. See the License for the specific language governing permissions and
.. limitations under the License.
.. ===============LICENSE_END=========================================================

====================
Athena Release Notes
====================
Athena is the first release of the Acumos platform.

* Release Name: Athena
* Release Version: 1.0.0
* Release Date: 7 November 2018

:doc:`Component Manifest <manifest-athena>`

Release Highlights
==================
Portal and Marketplace
----------------------
* Marketplace personalization - ability to choose model tags (IoT, Mobile, Wireless, etc) so those models will appear first in the Marketplace
* Model authorship
* New user email verification
* Publisher role added so models can be approved before being published to the Public Marketplace
* Ability to download Kubernetes artifacts

Design Studio
-------------
* Enhanced CSV Data Broker
* SQL Data Broker
* Split and Join capability - parameter-based and array-based split/collation schemes
* Ability to create Directed Acyclic Graph (DAG) composite solutions
* Enhanced Model connector - support for orchestrating DAG solutions
* Enhanced Probe endpoints
* Validate composite solution and generate deployment blueprint

Federation
----------
* Site configuration

Deployment of Models
--------------------
* Models may be deployed to a local environment as well as to a Cloud environment
* Support added to deploy models to a Kubernetes environment

    * Deploy models on their own servers/VMs under a private Kubernetes environment
    * Deploy models on hardware - workstations or lab servers
    * Avoid complex prerequisites and costs associated with deploying on VMs/Docker

Platform Operation, Administration, and Management
--------------------------------------------------
* Deployment of the platform to a Kubernetes environment
* One-click, single node deployment to Kubernetes as well as Docker
* Kibana dashboard

Supported Browsers, Devices, and Resolutions
============================================
Detailed information can be found on the :doc:`supported-browsers` page.


Known Issues and Limitations
============================

* Onboarding

    * Java Client - command line onboarding does not support API token but does support JWT

* Design Studio

    * At least one model must be published to the Company Marketplace in order for the Design Studio to load
    * Design Studio Data Broker, Splitter, and Collator functionality requires that specific toolkit models be onboarded; see the Admin Guide for details (@TODO add direct link to section in admin guide)

* Portal Marketplace UI

    * Manage Themes - selecting themes - the instruction in the modal dialog states "Choose your tags..." but if you select more than one tag, the error message "You cannot select more than one tag" is displayed; only single tag selection is supported at this time
    * ON-BOARDING MODEL page contains incorrect URLs

        * **To know more about on-boarding, please have a look at** : https://docs.acumos.org/en/latest/AcumosUser/portal-user/portal/index.html should be https://docs.acumos.org/en/athena/AcumosUser/portal-user/portal/index.html
        * **Create an R model bundle** should take the user to https://docs.acumos.org/en/athena/AcumosUser/portal-user/portal/onboarding-r-guide.html



Security Notes
==============
Integrated security and license scanning of models is not available.

Installation
============
Acumos provides a one-click installation script for deploying to Ubuntu 16.04
development environments. Both docker-compose and Kubernetes options are
supported. Please see the :doc:`One Click Deploy User Guide
<../AcumosUser/oneclick-deploy/user-guide>` for details.

Documentation
=============
The Acumos Athena release provides multiple points of documentation:

 * A high level :doc:`Platform Architecture Guide <../architecture/index>` of how components
   relate to each other
 * A collection of documentation provided
   by :doc:`each component <../AcumosContributor/component-guides>`
 * The `Acumos wiki <https://wiki.acumos.org>`_ remains a good source of
   information on meeting plans and notes from committees, project teams and
   community events

Licenses
========
Acumos source code is licensed under the `Apache Version 2 License
<http://www.apache.org/licenses/LICENSE-2.0>`_.
Acumos documentation is licensed under the `Creative Commons Attribution 4.0
International License <http://creativecommons.org/licenses/by/4.0>`_.

How to Get Help
===============
There are two options for getting help installing and using the Acumos platform:

* the `Acumos Community mailing list <https://lists.acumos.org/g/acumosaicommunity>`_

    * You must create an account to use the mailing list
    * Please use ``[acumosaicommunity]Help:`` plus your question in the subject line

* `StackOverflow <https://stackoverflow.com/search?q=acumos>`_

Whether you post to the mailing list or to Stack Overflow, please be as
descriptive as possible in the body so it's easier for a community member to
help.

How to Report a Bug
===================
You can report a bug by creating a Jira issue in the `Acumos Jira
<https://jira.acumos.org>`_. You must log in with your `Linux Foundation ID <https://identity.linuxfoundation.org>`_.
Guidelines for the content of a bug report are `here
<https://wiki.acumos.org/display/AC/Reporting+Bugs>`_.


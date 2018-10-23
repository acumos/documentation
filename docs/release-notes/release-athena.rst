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

Supported Browsers, Devices, and Resolutions
============================================
Detailed information can be found on the :doc:`supported-browsers` page.


Known Issues and Limitations
============================
@TODO Update this section

* Java Client - command line onboarding does not support API token but does support JWT
* out of memory issues - onboarding and microservice generation

Security Notes
==============
@TODO talk to Bryan

Installation
============
Acumos provides a one-click installation script for deploying to Ubuntu 16.04
development environments. Both docker-compose and Kubernetes options are
supported. Please see the :doc:`One Click Deploy User Guide
<../AcumosUser/oneclick-deploy/user-guide>` for details.

@TODO Add production notes if Ken and Bobbie finish them for this release; if not, add to maintenance release docs


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
<https://jira.acumos.org>`_. You must log in with your Linux Foundation ID.
Guidelines for the content of a bug report are `here
<https://wiki.acumos.org/display/AC/Reporting+Bugs>`_.


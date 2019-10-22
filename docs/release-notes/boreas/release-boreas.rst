.. ===============LICENSE_START=======================================================
.. Acumos CC-BY-4.0
.. ===================================================================================
.. Copyright (C) 2017-2019 AT&T Intellectual Property & Tech Mahindra. All rights reserved.
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
Boreas Release Notes
====================
Boreas is the second release of the Acumos platform.

* Release Name: Boreas
* Release Version: 2.0.0
* Release Date: 5 June 2019
* Wiki: `Boreas Release Notes <https://wiki.acumos.org/display/REL/Acumos_Boreas_Release>`_ 

Release Highlights
==================

Support for onboarding of ONNX, PFA and Dockerized models.

Enhanced Acumos platform peering through a controlled process of partner catalog publication and subscription.

* Global catalog search capability
* Federation of Catalogs

Support for AI/ML model suppliers to provide a commercial software license with their models in the Acumos marketplace. 

* Security scans of license metadata for models [*]_
* Support verification of licenses and Right-To-Use for commercial models [*]_
* Logging to enable model activity tracking and reporting

Support for ML Workbench to allow the creation and training of AI/ML models in Acumos platform.        

* Support for Notebooks development environment (Jupyter).
* Support for Pipeline (NiFi [*]_ ) tools are integrated with Acumos.

Enhanced support for deploying Acumos platform under Kubernetes

Enhanced user experience in portal.

* Publishing, unpublishing, deploying , onboarding, model building, and chaining, etc.

Enhanced logging standards

* Log formats aligned with ONAP.
* Support for Log management tools. 

.. [*] Disabled with Security Verification turned off.
.. [*] Disabled with Security Verification turned off.
.. [*] NiFi Pipeline tools are available as a Beta Feature only under K8S.

Installation
============

For `Acumos Multi Node Installation <https://wiki.acumos.org/display/AC/Acumos+Installation>`_ .

Acumos provides a one-click installation script for deploying to Ubuntu 16.04
development environments. Both docker-compose and Kubernetes options are
supported. Please see the :doc:`One Click Deploy User Guide <../../submodules/system-integration/docs/oneclick-deploy/index>`_ for details.

Supported Browsers, Devices, and Resolutions
============================================
Detailed information can be found on the :doc:`../supported-browsers` page.

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


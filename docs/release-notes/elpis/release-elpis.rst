.. ===============LICENSE_START=======================================================
.. Acumos CC-BY-4.0
.. ========================================================================================
.. Copyright (C) 2017-2019 AT&T Intellectual Property & Tech Mahindra. All rights reserved.
.. ========================================================================================
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

=====================
Elpis Release Notes
=====================
Elpis is the fifth release of the Acumos platform.

* Release Name: Elpis
* Release Version: 5.0
* Release Date: 02 August 2021
* Wiki: `Elpis Release Notes <https://wiki.acumos.org/display/REL/Acumos_Elpis_Release>`_

Release Highlights
==================

- Automation of Model Deployment with your own CI tool:
	- Elpis Release is a first step towards a fully automated process from model on-boarding to model deployment. It is now possible to connect Acumos with your own CI tool (Jenkins) in order to trigger Jenkins jobs that could be used in the future to deploy your acumos model


- ONNX Client Enhancement:
	- Model bundle dump without  use of configuration file
	- License profile addition  when onboarding by CLI.


Installation
============

Acumos provides a Zero to Acumos (Z2A) installation process for deploying to Ubuntu 20.04
development environments.  The Z2A installation covers the case of starting with a VM or the case of starting from an existing Kubernetes installation.  The Z2A was built as a modular design leveraging installation already existing for components that Acumos depends on (Nexus/MariaDB/etc.)  The mindset is for any Acumos dependency you may use your own or use the defalt that is part of the Z2A installation.

To get begin `Start_Here <https://docs.acumos.org/en/latest/submodules/system-integration/docs/z2a/start-here.html>`_

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


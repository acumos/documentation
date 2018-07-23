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

===============================
Documentation Contributor Guide
===============================

.. note::

    This is a work in progress. Please help us improve it by contributing to the Docs project!


This guide describes how to create documentation for the Acumos platform. Acumos repositories create a variety of content depending on the nature of the project. For example, projects delivering a platform component may have different types of content from a project that creates libraries for a software development kit. The content from each project may be used together as a reference for that project and/or be used in documents are tailored to a specific user audience and task they are performing.

Much of the content in this document is derived from similar documentation processes used in other Linux Foundation Projects including ONAP, OPNFV and Open Daylight.

Acumos documentation is stored in git repositories, changes are managed with gerrit reviews, and published documents generated when there is a change in any source used to build the documentation.

Authors create source for documents in reStructured Text (RST) that is and published on `docs.acumos.org 
<http://docs.acumos.org/>`_. The Acumos `wiki <http://wiki.acumos.org/>`_ and other web sites can reference these rendered documents directly, allowing projects to easily maintain current release documentation.


.. toctree::
   :maxdepth: 2

   rst-and-sphinx.rst
   rst-vs-wiki.rst
   rst-dev-tools.rst
   documenting-apis.rst



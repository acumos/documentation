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
.. Acumos documentation master file

====================
Acumos Documentation
====================
Acumos AI is a platform and open source framework that makes it easy to build,
share, and deploy AI apps. Acumos standardizes the infrastructure stack and
components required to run an out-of-the-box general AI environment. This frees
data scientists and model trainers to focus on their core competencies and
accelerates innovation.

Acumos Releases
===============

Platform
--------
    .. note::
        **Athena Maintenance Release** There is a required database upgrade to populate Authorship data. Please see `User and Author Data Upgrade for CDS 1.18.x <https://docs.acumos.org/en/athena/submodules/common-dataservice/docs/upgrade.html>`_ for instructions.

.. toctree::
    :maxdepth: 3

    ../release-notes/athena-maint/index

.. toctree::
    :maxdepth: 1

    ../release-notes/athena/index


Component and Weekly
--------------------


.. toctree::
   :maxdepth: 2

   ../release-notes/index




Acumos Portal and Marketplace User Guides
=========================================
.. note::
    Data Scientists who are contributing models should reference the `Portal - For Modelers pages <https://docs.acumos.org/en/latest/AcumosUser/portal-user/portal/index.html>`_ of the `Portal and Marketplace User Guide <https://docs.acumos.org/en/latest/AcumosUser/portal-user/index.html>`_.



.. toctree::
   :maxdepth: 1

   ../AcumosUser/portal-user/index
   ../AcumosUser/portal-publisher/index
   ../AcumosUser/portal-admin/index
   ../submodules/design-studio/docs/design-studio-user-guide/index

Model On-Boarding Guides
========================
Java
----
The Acumos Java Client Library command line utility is used to on-board H2o.ai and Generic Java models. This library creates artifacts from an H2o or Generic Java model and pushes the artifacts to the on-boarding server for the H2o Model runner to be able to use them.

:doc:`Java Model On-Boarding Guide <../submodules/acumos-java-client/docs/end-user-guide/onboarding-java-guide>`

Python
------
The Acumos Python Client library is required for users who want to push their
TensorFlow and scikit-learn models to the Acumos Portal. You will use this
library for on-boarding all your models. The library creates meta-data by
introspection, packages all the necessary information, and then uploads it to
Acumos On-Boarding server. The Acumos Python Client library is packaged an
available on PyPI. Please see the `PyPI <https://pypi.org/project/acumos/>`_
page for instructions and a tutorial.

R
-
:doc:`R Model On-Boarding Guide <../submodules/acumos-r-client/docs/onboarding-r-guide>`


Acumos Operational User Guides
==============================

.. toctree::
   :maxdepth: 1

   ../submodules/system-integration/docs/oneclick-deploy/index
   ../submodules/platform-oam/docs/user-guide
   ../submodules/system-integration/docs/user-guide


Contributors to the Acumos Platform Code
========================================

Platform Architecture
---------------------

.. toctree::
    :maxdepth: 2

    ../architecture/index


Component Guides
----------------
The *Component Guides* section contains a variety of information that is useful to developers who are working on the platform code. Most projects are written in Java, with the Javadoc available `here <https://javadocs.acumos.org/>`_ .

.. toctree::
   :maxdepth: 2

   ../AcumosContributor/component-guides


Documentation Guide
-------------------

:doc:`docs-contributor-guide/index`


Please also visit the `Developer wiki <https://wiki.acumos.org/display/AC/Developer+Wiki>`_, which includes sections on how to contribute to Acumos.


Indices and Tables
==================

* :ref:`search`


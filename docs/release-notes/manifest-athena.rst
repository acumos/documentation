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

===============
Athena Manifest
===============

Operating System
================
The multi-node installation of Acumos was tested on Ubuntu 16.04 LTS.

The One Click installation has been run on Centos 7 and Ubuntu 16, 17, and 18.

Platform Components
===================
The components that comprise the Acumos Platform are released as Docker images on `Nexus <https://nexus3.acumos.org/#browse/browse:docker.release>`_.

Individual component release notes may be accessed from the :doc:`component-release-notes` page.


Core Components
---------------

.. csv-table::
   :header-rows: 1
   :align: left
   :file: core-components.csv

Model Execution Components
--------------------------

.. csv-table::
   :header-rows: 1
   :align: left
   :file: model-execution.csv



Third Party Software
--------------------

.. csv-table::
    :header: "Software", "Version"
    :widths: 50, 50
    :align: left

    `MariaDB <https://mariadb.org/>`_, 10.2
    `Kong <https://konghq.com/kong-community-edition/>`_, 0.11.0
    `Nexus Repository OSS <https://www.sonatype.com/nexus-repository-oss>`_, 3.x
    `Docker-CE <https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository>`_, 18.06.1-ce for Ubuntu 16.04
    `Kubernetes <https://kubernetes.io/>`_, 1.10

Supporting Libraries Used by Platform Components
================================================
These supporting libraries are released as Java JAR files and referenced as libraries by various platform components.

.. csv-table::
   :header-rows: 1
   :align: left
   :file: libraries.csv


Modeler Client Libraries
========================
These libraries are used by modelers on their local workstations to prepare models for onboarding.

.. csv-table::
   :header-rows: 1
   :align: left
   :file: clients.csv

Model Runners
=============

.. csv-table::
   :header-rows: 1
   :align: left
   :file: model-runners.csv

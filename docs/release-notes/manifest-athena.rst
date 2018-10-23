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
Ubuntu 16.04 LTS

Platform Components
===================
The core components that comprise the Acumos Platform are released as Docker images on Nexus.

@TODO find public link to release nexus

@TODO maybe organize by Core Components, and Supporting components to match arch guide??
table here with project, component, version, link to release notes; expand to include library vs docker?


.. csv-table::
    :header: "Project", "Component", "Version", "Release Notes"
    :widths: 15, 25, 15, 35
    :align: left

    "Catalog, Data Model, and Data Management", "common-dataservice", "1.18.3", :doc:`../submodules/common-dataservice/docs/release-notes`
    "Catalog, Data Model, and Data Management", "federation-gateway", "1.18.6", :doc:`../submodules/federation/docs/release-notes`
    "Deployment", "acumos-azure-client", "1.2.22", :doc:`../submodules/acumos-azure-client/docs/release-notes`


Supporting Libraries Used by Platform Components
================================================
These supporting libraries are released as Java JAR files and referenced as libraries by various platform components.

.. csv-table::
    :header: "Project", "Component", "Version", "Release Notes"
    :widths: 15, 25, 15, 35
    :align: left

    "Catalog, Data Model, and Data Management", "common data service client", "?", :doc:`../submodules/common-dataservice/docs/release-notes`
    "Catalog, Data Model, and Data Management", "model-schema", "?", :doc:`../submodules/model-schema/docs/release-notes`


Third Party Components
======================
@TODO components/versions - reformat this section

* MariaDB - 10.2
* KongAPI - kong 0.11.0, postgres 9.4; see the :doc:`System Integration User Guide <../submodules/system-integration/docs/user-guide>` for more information.
* Nexus - 3.x
* Docker-CE - 18.06.1-ce for Ubuntu 16.04; see the `Docker installation instructions <https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository>`_
* Kubernetes 1.10


Modeler Client Libraries
========================
The client libraries used by Modelers are part of the Model Onboarding project.

.. csv-table::
    :header: "Component", "Version", "Location", "Release Notes"
    :widths: 15, 25, 15, 35
    :align: left

    "Java Client", "?", "Nexus", :doc:`../submodules/acumos-java-client/docs/release-notes`
    "Python Client", "?", "PyPI", :doc:`../submodules/acumos-python-client/docs/release-notes`
    "R Client", "?", "RForge", :doc:`../submodules/acumos-r-client/docs/release-notes`
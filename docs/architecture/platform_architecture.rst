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

============
Architecture
============
.. topics to include:
.. diagram from wiki for an abstracted high level diagram for non-technical consumers
.. at least one entity-relationship diagram (classical architecture view)
.. reference points in the architecture and related APIs, at a high level
.. high-level description of each core component of the platform, and supporting
.. components: what they are, scope, role, how they interact/communicate, 
..   links to component guides
..     -- images/component-architecture-2017.png is outdated
.. images from wiki are in the images folder

Architecture Overview
=====================

.. image::  images/component-architecture-2017.png

Entity Relationships
====================

.. image:: images/acumos-architecture-detail.png

Interfaces and APIs
===================

External Interfaces and APIs
----------------------------

E1 - Toolkit Onboarding
.......................

The various clients used to onboard models call the APIs in the Onboarding service.
See the :doc:`Onboading App <../../submodules/on-boarding/docs/index>` documentation for details.

E2 - Web APIs
.............

E3 - OA&M APIs
..............

E4 - Admin APIs
...............

E5 - Federation APIs
....................

E6 - Deployment APIs
....................

The Deployment subsystem primarily consumes APIs of external systems such as
cloud service environments, including Azure, OpenStack, and private kubernetes
clouds. The developer guides for the "Deployers" that coordinate model
deployment in those specific environments address the specific APIs consumed by
those Deployers. See the following for more information:

* `Acumos Azure Client <https://docs.acumos.org/en/latest/submodules/acumos-azure-client/docs/developer-guide.html>`_
* `Openstack Client <https://docs.acumos.org/en/latest/submodules/openstack-client/docs/developer-guide.html>`_
* `Kubernetes Client <https://docs.acumos.org/en/latest/submodules/kubernetes-client/docs/deploy-in-private-k8s.html>`_

Internal Interfaces and APIs
----------------------------

Common Data Service
...................

Hippo CMS
.........

Portal Backend
..............

Federation Gateway
..................

Microservice Generation
.......................

DCAE Model API

URL = http://onboarding-app:8090/onboarding-app/v2/dcae_models

Method : POST

data params : ONAP model

Description : Build DCAE/ONAP microservice and artifact for existing ONAP models.


Security Verification
.....................

Azure Client
............

OpenStack Client
................

Kubernetes Client
.................

Component Logging
.................

ELK Stack
.........

Nexus
.....

Docker
......

Kong
....

Core Components
===============
.. high level description of the components and link to more info

The following sections describe the scope, role, and interaction of the core
Acumos platform components and component libraries. The sections are organized
per the Acumos project teams that lead development on the components.

Portal and User Experience
--------------------------

Portal Frontend
...............

Portal Backend
..............

Hippo CMS
.........

Model Onboarding
----------------

Onboarding App
..............

The Onboarding app provides an ingestion interface for different types of
models to enter the Acumos platform.  The solution for accommodating a myriad
of different model types is to provide a custom wrapping library for each
runtime. The client libraries encapsulate the complexity surrounding the
serialization and deserialization of models.

The Onboarding App interacts with the following Acumos platform components and
supporting services:

* the :doc:`Portal <../../submodules/portal-marketplace/docs/index>`,
  which calls the Onboarding app during web-based model onboarding
* the :doc:`Nexus Client <../../submodules/acumos-nexus-client/docs/developer-guide>`,
  which stores and retrieves model artifacts from the Nexus maven repo
* the :doc:`Common Data Service Client <../../submodules/common-dataservice/docs/client>`,
  which stores model attributes
* the :doc:`TOSCA Generator <>` @TODO add link to docs
* the :doc:`Microservice Generation <<../../submodules/microservice-generation/docs/index>>`, which creates the dockerized microservice

For more information: :doc:`Onboading Documentation <../../submodules/onboarding/docs/index>`.

Java Client
...........

The Acumos Java Client is a Java client library used to on-board H2o.ai and
Generic Java models. This library creates artifacts required by Acumos,
packages them with the model in a bundle, and pushes the
model bundle to the onboarding server.

The Java Client interacts with the Onboading app.

For more information: :doc:`Java Client Documentation <../../submodules/acumos-java-client/docs/index>`.

Python Client
.............
The Acumos Java Client is a Python client library used to on-board Python
models and more specifically Scikit learn, TensorFlow and TensorFlow/Keras
models. It creates artifacts required by Acumos, packages them with the model
in a bundle, and pushes the model bundle to the onboarding app.

The Python Client interacts with the Onboading app.

For more information: :doc:`Python Client Documentation <../../submodules/acumos-python-client/docs/index>`.

R Client
........
The R client is a R package that contains all the necessary functions to
create a R model for Acumos. It creates artifacts required by Acumos, packages
them with the model in a bundle, and pushes the model
bundle to the onboarding app.

The R Client interacts with the Onboading app.

For more information: :doc:`R Client Documentation <../../submodules/acumos-r-client/docs/index>`.

Design Studio
-------------

Design Studio Composition Engine
................................

Data Broker
...........

Runtime Orchestrator ("Model Connector")
........................................

Proto Viewer ("Probe")
......................

Deployment
----------

Azure Client
............

Openstack Client
................

Kubernetes Client
.................

Docker Proxy
............

Catalog, Data Model and Data Management
---------------------------------------

Common Data Service
...................

Federation Gateway
..................

Model Schema
............

Common Services
---------------

Microservice Generation
.......................

Nexus Client
............

Generic Model Runner
....................

Python DCAE Model Runner
........................

Security Verification
.....................

Supporting Components
=====================
.. high level description of the components and link to more info

The following sections describe the scope, role, and interaction of supporting
Acumos platform components and tools.

Operations, Admin, and Maintenance (OAM)
----------------------------------------

System Integration
..................

Filebeat
........

Metricbeat
..........

ELK Stack
.........

Other Supporting Components
---------------------------

MariaDB
.......

Nexus
.....

Kong
....

Docker-CE
.........

Kubernetes
..........

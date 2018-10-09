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

* :doc:`Acumos Azure Client <../../submodules/acumos-azure-client/docs/developer-guide.html>`_
* :doc:`Openstack Client <../../submodules/openstack-client/docs/developer-guide.html>`_
* :doc:`Kubernetes Client <../../submodules/kubernetes-client/docs/deploy-in-private-k8s.html>`_

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

Java Client
...........

Python Client
.............

R Client
........

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

The deployment components enable users to launch models and solutions (composite
models with additional supporting components) in various runtime environments,
which are generally specific to the deployment component "client". These clients
are invoked by user actions in the Portal, e.g. selecting a deployment target
for a model in the various UI views where deployment is an option.

Azure Client
............

The Azure Client assists the user in deploying models into the Azure cloud
service, as described in the :doc:`Deploy Acumos Model to Azure User Guide <../../AcumosUser/portal-user/deployment/deploy-to-azure.html>`_.
The Azure Client uses Azure APIs to perform actions such as creating a VM where
the model will be deployed. The process depends upon a variety of prerequisite
configuration steps by the user, as described in the user guide linked above.

Once a VM has been created, the Azure Client executes commands on the VM to
download and deploy the various model components. See the
`Acumos Azure Client Developers Guide <../../submodules/acumos-azure-client/docs/developer-guide.html>`_
for more info.

The Azure Client interacts with the following Acumos platform components and
supporting services:

* the :doc:`Portal <../../submodules/portal-marketplace/docs/index.html>`_,
  for which the Azure Client coordinates model deployment upon request by
  the user
* the :doc:`Nexus Client <../../submodules/acumos-nexus-client/docs/developer-guide.html>`_,
  which retrieves model artifacts from the Nexus maven repo
* the :doc:`Common Data Service Client <../../submodules/common-dataservice/docs/client.html>`_,
  which retrieves model attributes stored in the CDS
* the :doc:`Runtime Orchestrator <../../submodules/runtime-orchestrator/docs/index.html>`_,
  which the Azure Client configures with the information needed to route
  protobuf messages through a set of composite model microservices
* the :doc:`Data Broker <../../submodules/databroker/docs/index.html>`_,
  which the Azure Client configures with the information needed to ingest model
  data into the model
* the :doc:`Proto Viewer <../../submodules/proto-viewer/docs/index.html>`_,
  which the Azure Client configures with the information needed to display
  model messages on the Proto Viewer web interface
* the :doc:`Filebeat <https://www.elastic.co/products/beats/filebeat>`_ service,
  which collects the log files created by the Azure Client, using a shared
  volume
* supporting services

  * the docker-engine, which retrieves docker images from the Acumos platform
    Nexus docker repo
  * the Acumos project Nexus docker repo, for access to deployment components
    such as the Runtime Orchestrator, Data Broker, and Proto Viewer

Openstack Client
................

The Openstack Client assists the user in deploying models into an Openstack
based public cloud hosted by Rackspace, as described in the
`Openstack Client Users Guide <../../submodules/openstack-client/docs/user-guide.html>`_.
The Openstack Client uses OpenStack APIs to perform actions such as creating a
VM where the model will be deployed. The process depends upon a variety of
prerequisite configuration steps by the user, as described in the user guide
linked above.

Once a VM has been created, the Openstack Client executes commands on the VM to
download and deploy the various model components. See the
`Openstack Client Developers Guide <../../submodules/openstack-client/docs/developer-guide.html>`_
for more info.

The Openstack Client interacts with the following Acumos platform components and
supporting services:

* the :doc:`Portal <../../submodules/portal-marketplace/docs/index.html>`_,
  for which the OpenStack Client coordinates model deployment upon request by
  the user
* the :doc:`Nexus Client <../../submodules/acumos-nexus-client/docs/developer-guide.html>`_,
  which retrieves model artifacts from the Nexus maven repo
* the :doc:`Common Data Service Client <../../submodules/common-dataservice/docs/client.html>`_,
  which retrieves model attributes stored in the CDS
* the :doc:`Runtime Orchestrator <../../submodules/runtime-orchestrator/docs/index.html>`_,
  which the Openstack Client configures with the information needed to route
  protobuf messages through a set of composite model microservices
* the :doc:`Data Broker <../../submodules/databroker/docs/index.html>`_,
  which the Openstack Client configures with the information needed to ingest model
  data into the model
* the :doc:`Proto Viewer <../../submodules/proto-viewer/docs/index.html>`_,
  which the Openstack Client configures with the information needed to display
  model messages on the Proto Viewer web interface
* the :doc:`Filebeat <https://www.elastic.co/products/beats/filebeat>`_ service,
  which collects the log files created by the Openstack Client, using a shared
  volume
* supporting services

  * the docker-engine, which retrieves docker images from the Acumos platform
    Nexus docker repo
  * the Acumos project Nexus docker repo, for access to deployment components
    such as the Runtime Orchestrator, Data Broker, and Proto Viewer

Kubernetes Client
.................

The Kubernetes Client and associated tools assists the user in deploying models
into a private kubernetes cloud, as described in
`Acumos Solution Deployment in Private Kubernetes Cluster <../../submodules/kubernetes-client/docs/deploy-in-private-k8s.html>`_.

For a model that the user wants to deploy (via the "deploy to local" option),
the Kubernetes Client generates a deployable solution package, which as described
in the guide above, is downloaded by the user. After unpacking the solution
package (zip file), the user then takes further actions on the host where the
models will be deployed, using a set of support tools included in the downloaded
solution package:

* optionally installing a private kubernetes cluster (if not already existing)
* deploying the model using an automated script, and the set of model artifacts
  included in the solution package

The Kubernetes Client interacts with the following Acumos platform components:

* the :doc:`Portal <../../submodules/portal-marketplace/docs/index.html>`_,
  for which the Kubernetes Client coordinates model deployment upon request by
  the user
* the :doc:`Nexus Client <../../submodules/acumos-nexus-client/docs/developer-guide.html>`_,
  which retrieves model artifacts from the Nexus maven repo
* the :doc:`Common Data Service Client <../../submodules/common-dataservice/docs/client.html>`_,
  which retrieves model attributes stored in the CDS
* the :doc:`Filebeat <https://www.elastic.co/products/beats/filebeat>`_ service,
  which collects the log files created by the Kubernetes Client, using a shared
  volume

The Kubernetes Client deployment support tool "deploy.sh" interacts with the
following Acumos platform components and supporting services:

* the :doc:`Runtime Orchestrator <../../submodules/runtime-orchestrator/docs/index.html>`_,
  which deploy.sh configures with the information needed to route
  protobuf messages through a set of composite model microservices
* the :doc:`Data Broker <../../submodules/databroker/docs/index.html>`_,
  which deploy.sh  configures with the information needed to ingest model
  data into the model
* the :doc:`Proto Viewer <../../submodules/proto-viewer/docs/index.html>`_,
  which deploy.sh configures with the information needed to display
  model messages on the Proto Viewer web interface
* supporting services

  * the docker-engine, which retrieves docker images from the Acumos platform
    Nexus docker repo
  * the kubernetes master (via the kubectl client), to configure, manage,
    and monitor the model components
  * the Acumos project Nexus docker repo, for access to deployment components
    such as the Runtime Orchestrator, Data Broker, and Proto Viewer

Docker Proxy
............

As described in
`Acumos Solution Deployment in Private Kubernetes Cluster <../../submodules/kubernetes-client/docs/deploy-in-private-k8s.html>`_,
the Docker Proxy provides an authentication proxy for the Acumos platform docker
repo. Apart from the use for model deployment into kubernetes, the Docker Proxy
addresses a key need of Acumos platform users, and opportunities to enhance the
other deployment clients related to:

* the ability to retrieve model microservice docker images from the Acumos
  platform using the normal process of "docker login" followed by "docker pull"

Using the normal docker protocol for image download will enhance the simplicity,
speed, efficiency, and reliability of:

* user download of a model for local deployment, e.g. for local testing
* deployment processes using the Azure and OpenStack clients, to be considered
  as a feature enhancement in the Boreas release

The Docker Proxy interacts with the following Acumos platform components and
supporting services:

* the Kubernetes Client deployment support tool "deploy.sh", for which the
  Docker Proxy provides docker login and image pull services
* supporting services

  * The Nexus docker repo, from which the Docker Proxy pulls model microservice
    images

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

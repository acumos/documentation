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

The OA&M subsystem defines data formats supported by the various logging
and analytics support components described under
`Operations, Admin, and Maintenance (OAM)`_. These are primarily focused on
log formats that Acumos components will follow when saving log files that are
collected by the logging subsystem.

E4 - Admin APIs
...............

E5 - Federation APIs
....................

The federation (public) E5 interface is a REST-based API specification.
Any system that decides to federate needs to implement this interface, which
assumes a pull-based mechanism.  As such, only the server side is defined by E5.
The server allows clients to poll to discover solutions, and to retrieve solution
metadata, solution artifacts and user-provided documents.
See the following for more information:

* :doc:`Federation Gateway <../../submodules/federation/docs/developer-guide>`

E6 - Deployment APIs
....................

The Deployment subsystem primarily consumes APIs of external systems such as
cloud service environments, including Azure, OpenStack, and private kubernetes
clouds. The developer guides for the "Deployers" that coordinate model
deployment in those specific environments address the specific APIs consumed by
those Deployers. See the following for more information:

* :doc:`Acumos Azure Client <../../submodules/acumos-azure-client/docs/developer-guide>`
* :doc:`Openstack Client <../../submodules/openstack-client/docs/developer-guide>`
* :doc:`Kubernetes Client <../../submodules/kubernetes-client/docs/deploy-in-private-k8s>`

Microservice Generation
.......................

The DCAE model API is intended to be used with models dedicated for ONAP. It builds a DCAE/ONAP
microservice and required artifacts.
See the :doc:`Microservice Generation <../../submodules/microservice-generation/docs/index>`
documentation for details.

Internal Interfaces and APIs
----------------------------

Common Data Service
...................

The Common Data Service provides a storage and query micro service for use by system
components, backed by a relational database.  The API provides Create, Retrive, Update
and Delete (CRUD) operations for system data including users, solutions, revisions,
artifacts and more. The microservice endpoints and objects are documented extensively
using code annotations that are published via Swagger in a running server, ensuring that
the documentation is exactly synchronized with the implementation. View this API
documentation in a running CDS instance at a URL like the following, but consult the
server's configuration for the exact port number (e.g., "8000") and context path
(e.g., "ccds") to use::

    http://localhost:8000/ccds/swagger-ui.html

See the following for more information:

* :doc:`Common Data Service <../../submodules/common-dataservice/docs/server>`

Hippo CMS
.........

Portal Backend
..............

Federation Gateway
..................

The federation (local) E5 interface is a REST-based API specification, just like the public
interface.  This interface provides secure communication services to other components of the
same Acumos instance, primarily used by the Portal.  The services include querying remote peers
for their content and fetching that content as needed.
See the following for more information:

* :doc:`Federation Gateway <../../submodules/federation/docs/design>`

Microservice Generation
.......................

Security Verification
.....................

Azure Client
............

The Azure Client exposes two APIs that are used by the Portal-Markeplace to
initiate model deployment in the Azure cloud service environment:

* POST /azure/compositeSolutionAzureDeployment
* POST /azure/singleImageAzureDeployment

The Azure Client API URL is configured for the Portal-Markeplace in the Portal-FE
component template (docker or kubernetes).

See :doc:`Azure Client API <../../submodules/acumos-azure-client/docs/developer-guide>` for details.

OpenStack Client
................

The OpenStack Client exposes two APIs that are used by the Portal-Markeplace to
initiate model deployment in an OpenStack service environment hosted by Rackspace:

* POST /openstack/compositeSolutionOpenstackDeployment
* POST /openstack/singleImageOpenstackDeployment

The OpenStack Client API URL is configured for the Portal-Markeplace in the Portal-FE
component template (docker or kubernetes).

See :doc:`OpenStack Client API <../../submodules/openstack-client/docs/developer-guide>` for details.

Kubernetes Client
.................

The Kubernetes Client expose one API that is used by the Portal-Markeplace to
provide the user with a downloadable deployment package for a model to be
deployed in a private kubernetes service environment:

* GET /getSolutionZip/{solutionId}/{revisionId}

The Kubernetes Client API URL is configured for the Portal-Markeplace in the Portal-FE
component template (docker or kubernetes).

See :doc:`Kubernetes Client API <../../submodules/kubernetes-client/docs/deploy-in-private-k8s>` for details.

ELK Stack
.........

The `ELK Stack <https://www.elastic.co/elk-stack>`_ is used to provide the
`E3 - OA&M APIs`_ via which components publish standard-format log files for
aggregation and presentation at operations dashboards.

Nexus
.....

The Nexus component exposes two APIs enabling Acumos platform components to store
and access artifacts in various repository types, including:

* Maven (for generic artifacts)
* docker (as a docker registry), using the
  `Docker Registry HTTP API V2 <https://docs.docker.com/registry/spec/api/>`_

The Maven repository service is accessed via an API exposed thru the
`Nexus Client`_ Java library. The docker repository service is accessed via the
`Docker Registry HTTP API V2 <https://docs.docker.com/registry/spec/api/>`_.
Both services are configured for clients through URLs and credentials
defined in the component template (docker or kubernetes).

Docker
......

The docker-engine is the primary service provided by `Docker-CE`_, as used in
Acumos. The docker-engine is accessed by the
`Docker Engine API <https://docs.docker.com/engine/api/v1.30/>`_.

The docker-engine API URL is configured for Acumos components in the template
(docker or kubernetes) for the referencing component.

Kong
....

`Kong <https://konghq.com/kong-community-edition/>`_ provides a reverse proxy
service for Acumos platform functions exposed to users, such as the
Portal-Marketplace UI and APIs, and the Onboarding service APIs.
The kong proxy service is configured via the
`Kong Admin API <https://docs.konghq.com/0.14.x/admin-api/>`_.

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
* the :doc:`Microservice Generation <../../submodules/microservice-generation/docs/index>`, which creates the dockerized microservice

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

The deployment components enable users to launch models and solutions (composite
models with additional supporting components) in various runtime environments,
which are generally specific to the deployment component "client". These clients
are invoked by user actions in the Portal, e.g. selecting a deployment target
for a model in the various UI views where deployment is an option.

Azure Client
............

The Azure Client assists the user in deploying models into the Azure cloud
service, as described in the :doc:`Deploy Acumos Model to Azure User Guide <../../AcumosUser/portal-user/deployment/deploy-to-azure>`.
The Azure Client uses Azure APIs to perform actions such as creating a VM where
the model will be deployed. The process depends upon a variety of prerequisite
configuration steps by the user, as described in the user guide linked above.

Once a VM has been created, the Azure Client executes commands on the VM to
download and deploy the various model components. See the
:doc:`Acumos Azure Client Developers Guide <../../submodules/acumos-azure-client/docs/developer-guide>`
for more info.

The Azure Client interacts with the following Acumos platform components and
supporting services:

* the :doc:`Portal <../../submodules/portal-marketplace/docs/index>`,
  for which the Azure Client coordinates model deployment upon request by
  the user
* the :doc:`Nexus Client <../../submodules/acumos-nexus-client/docs/developer-guide>`,
  which retrieves model artifacts from the Nexus maven repo
* the :doc:`Common Data Service Client <../../submodules/common-dataservice/docs/client>`,
  which retrieves model attributes stored in the CDS
* the :doc:`Runtime Orchestrator <../../submodules/runtime-orchestrator/docs/index>`,
  which the Azure Client configures with the information needed to route
  protobuf messages through a set of composite model microservices
* the :doc:`Data Broker <../../submodules/databroker/docs/index>`,
  which the Azure Client configures with the information needed to ingest model
  data into the model
* the :doc:`Proto Viewer <../../submodules/proto-viewer/docs/index>`,
  which the Azure Client configures with the information needed to display
  model messages on the Proto Viewer web interface
* the `Filebeat <https://www.elastic.co/products/beats/filebeat>`_ service,
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
:doc:`Openstack Client Users Guide <../../submodules/openstack-client/docs/user-guide>`.
The Openstack Client uses OpenStack APIs to perform actions such as creating a
VM where the model will be deployed. The process depends upon a variety of
prerequisite configuration steps by the user, as described in the user guide
linked above.

Once a VM has been created, the Openstack Client executes commands on the VM to
download and deploy the various model components. See the
:doc:`Openstack Client Developers Guide <../../submodules/openstack-client/docs/developer-guide>`
for more info.

The Openstack Client interacts with the following Acumos platform components and
supporting services:

* the :doc:`Portal <../../submodules/portal-marketplace/docs/index>`,
  for which the OpenStack Client coordinates model deployment upon request by
  the user
* the :doc:`Nexus Client <../../submodules/acumos-nexus-client/docs/developer-guide>`,
  which retrieves model artifacts from the Nexus maven repo
* the :doc:`Common Data Service Client <../../submodules/common-dataservice/docs/client>`,
  which retrieves model attributes stored in the CDS
* the :doc:`Runtime Orchestrator <../../submodules/runtime-orchestrator/docs/index>`,
  which the Openstack Client configures with the information needed to route
  protobuf messages through a set of composite model microservices
* the :doc:`Data Broker <../../submodules/databroker/docs/index>`,
  which the Openstack Client configures with the information needed to ingest model
  data into the model
* the :doc:`Proto Viewer <../../submodules/proto-viewer/docs/index>`,
  which the Openstack Client configures with the information needed to display
  model messages on the Proto Viewer web interface
* the `Filebeat <https://www.elastic.co/products/beats/filebeat>`_ service,
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
:doc:`Acumos Solution Deployment in Private Kubernetes Cluster <../../submodules/kubernetes-client/docs/deploy-in-private-k8s>`.

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

* the :doc:`Portal <../../submodules/portal-marketplace/docs/index>`,
  for which the Kubernetes Client coordinates model deployment upon request by
  the user
* the :doc:`Nexus Client <../../submodules/acumos-nexus-client/docs/developer-guide>`,
  which retrieves model artifacts from the Nexus maven repo
* the :doc:`Common Data Service Client <../../submodules/common-dataservice/docs/client>`,
  which retrieves model attributes stored in the CDS
* the `Filebeat <https://www.elastic.co/products/beats/filebeat>`_ service,
  which collects the log files created by the Kubernetes Client, using a shared
  volume

The Kubernetes Client deployment support tool "deploy.sh" interacts with the
following Acumos platform components and supporting services:

* the :doc:`Runtime Orchestrator <../../submodules/runtime-orchestrator/docs/index>`,
  which deploy.sh configures with the information needed to route
  protobuf messages through a set of composite model microservices
* the :doc:`Data Broker <../../submodules/databroker/docs/index>`,
  which deploy.sh  configures with the information needed to ingest model
  data into the model
* the :doc:`Proto Viewer <../../submodules/proto-viewer/docs/index>`,
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
:doc:`Acumos Solution Deployment in Private Kubernetes Cluster <../../submodules/kubernetes-client/docs/deploy-in-private-k8s>`,
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

This project includes the Common Data Service, the Federation Gateway, and the Model Schema subprojects.

Common Data Service
...................

The Acumos Common Data Service provides a storage and query layer between Acumos system
components and a relational database.
The server component is a Java Spring-Boot application that provides REST service to callers
and uses Hibernate to manage the persistent store.
The client component is a Java library that provides business objects (models) and
methods to simplify the use of the REST service.

For more info: :doc:`../../submodules/common-dataservice/docs/index`


Federation Gateway
..................

The Federation Gateway component provides a mechanism to exchange models
between two Acumos instances via a secure network channel.  The Gateway is
implemented as a server that listens for requests on a REST API.  It also
has a client feature that communicates with remote instances.

For more info: :doc:`../../submodules/federation/docs/index`

Model Schema
............

The Model Schema is the JSON schema used to define and validate the Acumos model metadata generated by client libraries
such as the Acumos python client library.

For more info: :doc:`../../submodules/model-schema/docs/index`


Common Services
---------------

Microservice Generation
.......................

The Microservice Generation component is in charge of dockerize the model, create the microservice and
store artifacts in Nexus.

For more information :doc:`Microservice Generation <../../submodules/microservice-generation/docs/index>`.

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

The Platform-OAM project maintains the repos providing:

* Acumos platform deployment support tools 
* Logging and Analytics components based upon the
  `ELK Stack <https://www.elastic.co/elk-stack>`_, of which Acumos uses the
  open source versions

System Integration
..................

The `System Integration repo <https://github.com/acumos/system-integration>`_
contains Acumos platform deployment support tools e.g.

* Docker-compose templates for manual platform installation under docker-ce
* Kubernetes templates for platform deployment in Azure-kubernetes
* Oneclick / All-In-One (AIO) platform deployment under docker-ce or kubernetes

  * See :doc:`One Click Deploy User Guide <../../AcumosUser/oneclick-deploy/user-guide>`

Filebeat
........

`Filebeat <https://www.elastic.co/products/beats/filebeat>`_ is a support
component for the ELK stack. Filebeat monitors persistent volumes in which
Acumos components save various log files, and aggregates those files for
delivery to the Logstash service.

Metricbeat
..........

`Metricbeat <https://www.elastic.co/products/beats/metricbeat>`_ is a support
component for the ELK stack. Metricbeat monitors host and process resources
and delivers the to the Logstash service.

ELK Stack
.........

The `ELK Stack <https://www.elastic.co/elk-stack>`_ provides the core services
that archive, access, and present analytics and logs for operations support
dashboards. It includes:

* Logstash: a server-side data processing pipeline that ingests data from
  multiple sources, transforms it, and then sends it to ElasticSearch for storage
* ElasticSearch: a data storage, search, and analytics engine
* Kibana: a visualization frontend for ElasticSearch based data

See :doc:`Platform Operations, Administration, and Management (OA&M) User Guide <../../submodules/platform-oam/docs/user-guide.html>` for more info.

Other Supporting Components
---------------------------

MariaDB
.......

`MariaDB <https://mariadb.org/>`_ is a relational database system. Acumos
platform components that directly use MariaDB for database services include:

* Common Data Service, for storage of platform data in the CDS database
* Portal-Marketplace, for storage of Hippos CMS data
* ELK stack, for access to platform user analytics

Acumos platform components access the MariaDB service via a URL and credentials
defined in the component template (docker or kubernetes).

Nexus
.....

`Nexus <https://help.sonatype.com/repomanager3>`_ (Nexus 3) is used as an
artifact repository, for

* artifacts related to simple and composite models
* model microservice docker images

Acumos platform components that directly use Nexus for repository services
include:

* Design Studio
* Onboarding
* Azure Client
* Microservice Generation
* Portal-Marketplace
* Federation

Kong
....

The `Kong Community Edition <https://docs.konghq.com/>`_ is an optional
component used as needed as a reverse proxy for web and API requests to the
platform. The primary web and API services exposed through the kong proxy are

* the Onboarding service APIs (URL paths based upon /onboarding-app)
* the Portal-Marketplace web frontend and APIs (all other URL paths)

Docker-CE
.........

`Docker Community Edition <https://docs.docker.com/install/>`_ is used as a key
component in the platform for the purposes:

* accessing docker repositories, including the Acumos platform docker repository
* building docker images
* launching containers on request of the kubernetes master node

The docker-engine is the main feature of Docker-CE used in Acumos, and is
deployed:

* for Docker-CE based platform deployments, on one of the platform hosts (e.g.
  VMs or other machines)
* for kubernetes based platform deployments, as a containerized service using the
  `Docker-in-Docker (docker-dind) <https://hub.docker.com/_/docker/>`_
  variant of the official docker images

Kubernetes
..........

Kubernetes provides a container management environment in which the Acumos
platform (as a collection of docker image components) and models can be deployed.
Kubernetes cluster installation tools are provided by the
`kubernetes-client repo <https://github.com/acumos/kubernetes-client>`_, and can
be used for establishing a private kubernetres cluster where the Acumos platform
and models can be deployed. The
:doc:`Acumos AIO <../../AcumosUser/oneclick-deploy/user-guide>` toolkit can
deploy the Acumos platform in a private kubernetes cluster. For kubernetes
clusters hosted by public cloud providers e.g. Azure, Acumos provides kubernetes
templates for the Acumos platform components in the
`system-integration <https://github.com/acumos/system-integration>`_ repo.
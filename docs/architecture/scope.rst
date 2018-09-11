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

=====
Scope
=====

This document provides an architectural overview of the Acumos platform, as of
the Athena release. All aspects of the Acumos platform are represented in this
overview, including:

* the Acumos portal, a web-based framework and content management system
  supporting Acumos platform operator and user interaction with the platform
* various core components of the Acumos platform that are deployed as integrated
  services with the Acumos portal, and provide specific functions in support of
  the user experience, such as

  * a model onboarding service
  * a model design studio service
  * various model deployment clients and supporting components, as of this
    release supporting deployment under Azure, OpenStack, and kubernetes
  * an inter-platform model federation service
  * various common services, such as a common data service and microservice
    generation service

* various model developer support clients, used in model onboarding
* various non-Acumos components that provide necessary dependencies as services
  to the platform, such as

  * runtime environment and control based upon Docker-CE and/or Kubernetes
  * a database backend service based upon MariaDB
  * a default artifact repository for Maven and docker artifacts, based upon
    Nexus
  * a default ingress controller / reverse proxy for the plaform, based upon Kong
  * various components that provde a platform logging and analytics service

    * a platform component log aggregation service based upon Filebeat
    * a platform host and container analytics service based upon Metricbeat
    * logging/analytics storage, search, and visualization based upon the ELK
      stack (ElasticSearch, Logstash, Kibana)

* deployment and operations support tools for the platform

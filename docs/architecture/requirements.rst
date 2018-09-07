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
Requirements
============
.. Requirements:
..    -goals
..    -what we want to do with this platform
..    -use cases as examples to illustrate the requirements in action
..    -Integration with ONAP
..    -roadmap
..    --Licensing of contributed models
..    --training

As described on the `Acumos.org website <https://acumos.org>`_, Acumos AI is a
platform and open source framework that makes it easy to build, share, and
deploy AI apps, and operate the Acumos portals that enable those capabilities.
Acumos standardizes the infrastructure stack and components required to run an
out-of-the-box general AI environment. This frees data scientists and model
trainers to focus on their core competencies and accelerates innovation.

The Acumos platform enables the following high-level set of capabilities in
support of the goals above, which are fulfilled through the various components
and interfaces of the Acumos platform architecture:

* Build machine-learning models and solutions

  * Use client libraries to generate model package for onboarding by CLI or Web
  * Generate model microservice images with embedded model runners based upon
    an Ubuntu docker base image
  * Design and generate composite solutions as a directed graph of multiple
    model microservices, with additional supporting components

* Share models and solutions

  * Onboard models by CLI and Web
  * Share with your team, and publish to company and public marketplaces
  * Federate multiple Acumos portals for model/solution distribution

* Deploy models and solutions

  * Download for local deployment under docker and kubernetes
  * Deploy to public and private clouds (Azure, OpenStack)
  * Interact with models, and observe solution-internal dataflow

* Operate Acumos platforms

  * Deploy the platform under docker or kubernetes, as a single-node
    (all-in-one) or multi-node platform
  * Secure the platform
  * Administer the platform via the portal UI
  * logging and analytics collectiom, storage, and visualization

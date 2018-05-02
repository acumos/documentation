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
Introduction
============

The Portal is a web-based tool designed for users who wish to either explore and use
machine learning models or data scientists who build models and wish to
share them with a larger community.

The Acumos Portal has two sections: (1) The Marketplace and associated
tools for people wishing to find, learn about and use (deploy or
download) models in their own computing environments; and (2) the
Modeler sections for people wishing to share, describe and market their
models. Modeler tools are available in several areas of the site, including
Onboarding, the Design Studio, My Models, and Manage My Model.

The Marketplace and Modeler communities may communicate and interact via the
commenting and rating tools for users.


It has the following key features:

    #. Easy Onboarding of Models. The Acumos Portal enables modelers to
       easily onboard their AI models, document them, and package them into
       reusable microservices. Newly onboarded models are located in the
       PRIVATE/UNPUBLISHED catalog, viewable only by the user. The Modeler
       may publish them to either their Company marketplace (viewable by
       others with logins on their local Acumos instance) or to the PUBLIC
       Marketplace, where they may be distributed to a wider community.

    #. Explore the Possibilities of AI. The Marketplace enables users to
       explore, gathering high-level or detailed information about a model
       and how it is used. Users have access to extensive documentation, as
       well as ratings and comments from the greater community.

    #. Model Packaging. Models are packaged as Dockerized microservices so
       they can be deployed directly to a variety of environments. As a part
       of the onboarding process, protobuf files are created to describe the model
       inputs and outputs in a standard format, and a TOSCA file is generated
       to allow the model to be accessed in the Design Studio.

    #. Model Access. Once a model is selected, the Acumos Marketplace
       provides access to that model, either via downloading or by deploying
       it to any one of several commonly used cloud environments. Specialty
       access may be available on some instances. For example, models may be
       specifically designed to work on ONAP instances.

    #. Compose. Users may also work with models in the Design Studio,
       chaining them together to create new custom composite models to help
       solve specific business problems. These composite models can be saved
       and managed (validated, deployed, published) just like simple models.

    #. Federation. The Acumos Marketplace supports distributed relationships
       with other Acumos peer instances, allowing users to browse and procure
       models from remote federated partners. Federation also creates a much
       larger available user pool for data scientists to share their models.

    #. Training. Acumos provides methods to train models. Data sources can
       be discovered and training process can be designed in the Acumos
       Training Studio. (This work is in progress and not available in
       release 1.0.)


Users are welcomed to Acumos on the home page, showing a carousel
highlighting Acumos features and uses. Other parts of the page show
featured or trending models, upcoming Acumos events and illustrations of
how Acumos can help customize solutions in many domains.

Note: Users do not need to be logged into Acumos or have an account to see the
Home and Marketplace pages but users must be logged in to download or deploy models.
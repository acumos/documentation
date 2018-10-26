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

=============
Platform Flow
=============
.. images pulled from wiki are in images/flows folder
.. Platform User Flows  (user journeys/flow diagrams) 
.. creating and onboarding new models
.. training the model
.. publishing models to a catalog
.. deploying finished solutions to a runtime environment

User Journeys
-------------

Following are some illustrative "user journey" diagrams for common Acumos
workflows.

.. figure:: images/flows/acumos-platform-user-flow.png
   :scale: 100 %
   :alt: Acumos Platform User Flow

   ** Acumos Platform User Flow **

.. figure:: images/flows/user-sign-up.png
   :scale: 100 %
   :alt: Model User Signup Flow

   ** Acumos User Signup Flow **

.. figure:: images/flows/user-login.png
   :scale: 100 %
   :alt: Model User Login Flow

   ** Acumos User Login Flow **

Component Interaction
---------------------

Following are some illustrative diagrams for common Acumos component interactions.

.. figure:: images/flows/model-detail.png
   :scale: 100 %
   :alt: Model Detail Flow

   ** Acumos Model Detail Flow **

.. figure:: images/flows/catalog-flow.png
   :scale: 100 %
   :alt: Acumos Catalog Flow

   ** Acumos Catalog Flow **

Inter-Component Message Flows
-----------------------------

Following are some actual message flows between Acumos components. Some
URI parameters have been abstracted to reduce the complexity of the flows.

.. figure:: images/flows/onboard-web.svg
   :scale: 100 %
   :alt: Web Onboarding

   ** Web Onboarding **

.. figure:: images/flows/onboard-cli.svg
   :scale: 100 %
   :alt: CLI Onboarding

   ** CLI Onboarding **

.. figure:: images/flows/publish.svg
   :scale: 100 %
   :alt: Model Publishing

   ** Model Publishing **

.. figure:: images/flows/federation-subscriber.svg
   :scale: 100 %
   :alt: Request for Published Solution Subscription, at Subscribing Platform

   ** Request for Published Solution Subscription, at Subscribing Platform **

.. figure:: images/flows/federation-publisher.svg
   :scale: 100 %
   :alt: Request for Published Solution Subscription, at Publishing Platform

   ** Request for Published Solution Subscription, at Publishing Platform **

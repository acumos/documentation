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

=======================================
On-Boarding a Model Using the Portal UI
=======================================

A high-level summary of the onboarding steps and overview of the
workflow is shown below:

    .. image:: ../images/portal/models_onboardingJourney.png

The on-boarding process via web is accomplished by the following steps:

prerequisites : You have to create a model bundle in your own environement before start to on-board. Acumos cannot transform your model in a microservce with only the model itself, it needs some other relevent information contained in the model bundle. You can retrieve all the information to create your model bundle in the "ON-BOARDING BY WEB" home page

Once your model bundle is created, you have to follow these steps.

#. From the Acumos home page, select the "ON-BOARDING MODEL" tab in the left navigation.
#. Select "ON-BOARDING BY WEB".
#. Drag & Drop your model bundle.
#. When the uploading is finished click on "On-Board Model". This will initiate a series of back end process steps, illuminated as they run, by the cascade from left to right of the icons on the top of the page. These include, creating the microservice that will run in a docker container, creating a tosca file for your model so it can be used in the design studio, storing the artifacts and model.

    .. image:: ../images/portal/models_onboardingWeb.png

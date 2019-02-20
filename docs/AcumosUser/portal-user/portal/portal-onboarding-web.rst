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

A high-level summary of the on-boarding steps and overview of the
workflow is shown below:

    .. image:: ../images/portal/models_onboardingJourney.png


Prerequisites : You have to create a model bundle in your own environment 
before start to on-board. Acumos cannot transform your model in a microservice 
with only the model itself, it needs some other relevant information contained 
in the model bundle. The model bundle consists of component.json defining the 
component and its metadata, component.bin the binary payload and 
component.proto with the protobuf specs. You can retrieve all the information 
to create your model bundle in the "ON-BOARDING BY WEB" home page

    .. image:: ../images/portal/models_onboardingWeb.png

Once your model bundle has been created, follow these steps:

#. Select the "ON-BOARDING MODEL" tab in the outer left menu
#. Select "ON-BOARDING BY WEB"
#. Drag & Drop your model bundle or use the **Browse** button to select it
#. Click **Upload**
#. When uploading is finished, click on **On-Board Model**.

    .. image:: ../images/portal/models_onboardingWebNotice.png

This will initiate a series of back-end process steps, illuminated as they run, 
by the cascade from left to right of the icons on the top of the page. These 
include creating the microservice that will run in a docker container, 
creating a TOSCA file for your model so it can be used in the Design Studio, 
and storing the artifacts and model.

    .. image:: ../images/portal/models_onboardingWebSuccess.png
       :width: 75%

On-boarding is finished when all steps turn green. Click the **View Model** 
button to see your model in the **MY UNPUBLISHED MODELS** section of the 
:doc:`My Models <portal-my-models>` page.

If one of the steps appears in red, on-boarding has failed. Check your 
:doc:`notifications <portal-notifications>` to determine why on-boarding failed 
- there should be a message with a link to download on-boarding log files. If 
you need help debugging, please reach out to the Acumos Community or Dev 
Discuss `mailing lists <https://lists.acumos.org/g/main/subgroups>`_ or post on 
`StackOverflow <https://stackoverflow.com/search?q=acumos>`_.




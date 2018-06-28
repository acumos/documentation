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

The onboarding process via web is accomplished by the following steps:

#. From the On-Boarding tab in the left navigation, or from My Models
   page, select **Add New Model**
#. Select Web On-boarding
#. Complete all the user steps to onboard your model, including:

    #. Choose Toolkit
    #. Select **Download client library**
    #. Select **Upload Model Bundle** and drag your file from the local machine to the screen and select **Done**
    #. All the steps have been done (you will see the number for each converted to a green check mark), the **Add to Catalog** button will be enabled
    #. Select **Add to Catalog.** This will initiate a series of back end process steps, illuminated as they run, by the cascade from left to right of the icons on the top of the page. These include uploading the model and artifacts, creating the microservice that will run in a docker container, creating a tosca file for your model so it can be used in the design studio, storing the artifacts and model and creating the link so you can access your model in the **private/unpublished** section of your personal catalog

    .. image:: ../images/portal/models_onboardingWeb.png

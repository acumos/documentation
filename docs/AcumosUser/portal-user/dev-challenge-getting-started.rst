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
.. See the License for the specific language governing permissions and
.. limitations under the License.
.. ===============LICENSE_END=========================================================

=========================================
Acumos AI Challenge Getting Started Guide
=========================================

This guide is intended to help Acumos AI Challenge participants with basic info
and links to details about:

* the Acumos platform
* what aspects of the Acumos platform the developer will interact with, through
  the process of submitting models to the challenge and testing them

The Acumos Platform
-------------------

The platform developers will be using is described at http://docs.acumos.org/.
Since the docs are a work in progress, you can also see the slides presented at
the `Acumos at ONS 2018 <https://wiki.acumos.org/display/EVNT/Acumos+at+ONS+2018>`_
launch. Additional usage details are provided below for platform aspects that
might not be complete/clear from the current docs.

Below is a summary of the platform UI/workflow elements that developers will use
during the challenge. Other platform UI elements may be used (e.g. the Composite
Solution Design Studio), but their use is not planned for the challenge, and may
be disabled in the challenge platform.

* `Onboarding <http://docs.acumos.org/en/latest/AcumosUser/portal-user/portal/portal-onboarding-intro.html>`_
* `My Models <http://docs.acumos.org/en/latest/AcumosUser/portal-user/portal/portal-my-models.html>`_
* `Publishing a Model <http://docs.acumos.org/en/latest/AcumosUser/portal-user/portal/portal-manage-model.html#publishing-a-model>`_

Challenge Workflows
-------------------

This section provides an overview of how developers will use the Acumos platform
components listed above in the challenge. More details are provided in subsequent
sections.

First, here is a high-level summary of the process you (as a challenge
contestant) will go thru for the challenge. Details follow this summary.

* First, signup for the challenge at http://acumosaichallenge.devpost.com/,
  providing your name and email address.
* When the contest begins, an account will be created for you on the platform
  https://acumos-challenge.org, and you will receive an email with your username
  (your email address) and initial password (which you can change).

Once your receive your Acumos platform account credentials,

* It's recommended that you login to the platform at
  https://acumos-challenge.org, and get familiar with the UI.
* If you have questions about the UI, you can select "Q&A" on the left,
  which will take you to Stackoverflow where you can ask for help (be sure to
  mention Acumos in your question, so the community can see it asap).
* You will install the client library for the modeling toolkit that you are
  working with.
* Once you are ready to try out the onboarding of your model, you will go thru
  the Onboarding workflow after which your model will be in your private "My
  Models" area, and a deployable microservice docker image will have been
  created and saved in the Acumos Nexus repository (accessible only to you).
  NOTE: your model is not published/submitted yet, so you can feel free to
  work on it in private until you are ready, repeating the onboarding process
  etc as needed.
* You will use the "My Models" tools to add documentation, a license/copyright
  notice, test data, and demo video as metadata for your model.
* You will use the "My Models" tools to deploy/download your model, so that
  you verify the ability of the judges to do the same (this will be part of the
  judging process).
* You will optionally share your model with other developers, that you want to
  work with as a team.
* When you are ready to submit your model for judging, you will use the
  Publishing a Model workflow to submit it. Note that the metadata about your
  model (e.g. documents, description) will then be viewable in the platform
  Marketplace by other developers, but the code/microservice for your model will
  not be accessible to others until after the challenge.

Installing Toolkit Client Libraries
-----------------------------------

The Acumos toolkit client libraries can assist you in preparing model packages for
onboarding to the Acumos platform. Following are the currently supported toolkits,
with links to the guides for installing each:

* `Java and H2O models <http://docs.acumos.org/en/latest/AcumosUser/portal-user/portal/onboarding-java-guide.html>`_
* `Python models <https://pypi.org/project/acumos/>`_
   * Note: if you don't already have cython installed, you will need to install it (pip install cython) before installing the Acumos Python Client

* `R models <http://docs.acumos.org/en/latest/AcumosUser/portal-user/portal/onboarding-r-guide.html>`_

Onboard Your Model
------------------

When your model is ready for onboarding, you can use the "ON-BOARDING MODEL"
tab to access the "ON-BOARDING BY COMMAND LINE" or "ON-BOARDING BY WEB" options.

The following example describes the "ON-BOARDING BY WEB" option:

* Select "ON-BOARDING BY WEB"
* Select "Choose Toolkit" and select the toolkit type for your model
* For "Download Client Library from Command Line", click the "Installation of
  the toolkit library is completed" box
* Select "Upload Model Bundle" and browse or drag/drop the model zip package
  you created using the toolkit library
* Select "Model Name" and give your model a name
* Select "On-Board Model" and wait as the workflow icons above go from gray to
  green; the process may take 10 minutes or more to complete
* Once the process of onboarding is complete, you will see the icon on the right
  has text under it saying "Model is onboarded and available in private catalog"
* Select "View model" to be taken to the "My Models" tab
* Select the model you uploaded

In the next steps, you will add a description and documents for your model.

Add Metadata for Your Model
---------------------------

To add metadata (e.g. description, documentation, test data, video, marketplace
image) for your model:

* Select "Manage my model"
* Select "Publish to public marketplace"

  * NOTE: your model will not be published to the marketplace (submitted for
    judging) until you complete all the steps in this tool, and select
    "Submit to publication", so you can use this tool to add and update
    your model's metadata until you are ready to submit.

Using the "Submit to publication" dialog, the following metadata needs to be
added by you to your model, prior to submission:

* Select "Model Name" and enter a name for your model
* Select "Model Description" and enter a description of your model, similar to
  the level of detail you might find for an app in an appstore. You can add
  as detailed a description here as you wish, or upload a detailed description
  as a document.
* Select "Model Category" and from the drop-down options pick the appropriate
  "Category" and "Toolkit Type"
* Select "Model Documents" and upload

  * a LICENSE.txt file with license and copyright information (example below),
    including

    * Your name and/or organization as author of the model, and copyright holder
    * Declaration that all code is Apache 2.0 licensed
    * Declaration that all documentation is Creative Commons Attribution 4.0
      International licensed
    * Declaration that all sample data is Community Data License Agreement –
      Permissive, Version 1.0 licensed

  * a video of your model in operation
  * a zip file with sample data and/or a test application

    * a test application which includes/references sample data can be provided,
      as applicable to your model

  * a zip file with the source code of your model
  * a document describing your model, with enough detail for judges to be
    able to duplicate the test results shown in the video, using sample data
    and/or test application that you provide

* Select "Model Tags" and add at least one tag for your model. These are used
  in searching the Acumos marketplace for models.
* Select "Model Image", and upload a model image for the marketplace

Sample LICENSE.txt file:

.. code-block:: text

  ===============LICENSE_START=======================================================
  Copyright (C) 2017-2018 Jane Contestant. All rights reserved.

  Software included in this Acumos model package is distributed under the
  Apache License, Version 2.0 (the "License").
  You may not use this model package except in compliance with the License.
  You may obtain a copy of the License at
  http://www.apache.org/licenses/LICENSE-2.0

  Documentation included in this Acumos model package is distributed under the
  Creative Commons Attribution 4.0 International (CC BY 4.0) license (the "License").
  You may not use this documentation except in compliance with the License.
  You may obtain a copy of the License at
  https://creativecommons.org/licenses/by/4.0/

  Sample data included in this Acumos model package is distributed under the
  Community Data License Agreement – Permissive, Version 1.0 license (the "License").
  You may not use this sample data except in compliance with the License.
  You may obtain a copy of the License at
  https://cdla.io/permissive-1-0/

  This Acumos model package is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  ===============LICENSE_END=========================================================

Download and Test Models Locally
--------------------------------

Once your model has been onboarded, you can download the generated microservice
container (docker image) in tar format, for local deployment. You can use the
same steps below to download and test any of the models available in the Acumos
public marketplace. To download a model docker image:

* Ensure you first have a working docker installation. See e.g. the `docker-ce
  install instructions for Ubuntu 
  <https://docs.docker.com/install/linux/docker-ce/ubuntu/>`_
* Under "My Models" (to download your own model) or under "Marketplace", select
  the model you want to test
* Select "Version History"
* You will see a set of downloadable artifacts related to the model; select the
  "Action" (download) icon for the artifact named "<solution_id>:n", where
  "solution_id" is the ID of the model, and "n" is the version number you want
  to download.
* The model should be downloaded as a tarfile; note some models may be as much
  as 1GB in size, so this may take some time
* When download is complete, import the tarfile and run the image as below

  * Replace the filename with the name of the file as downloaded
  * "docker load" will output the image name/tag you should use in "docker run",
    e.g. "Loaded image: acumos-nexus3.acumos.org:10004/image_classifier:1"

.. code-block:: text

  docker load -i ~/Downloads/image_classifier_1387fe23-ad0a-4494-9d78-16404fb3c5b6_1.tar
  docker run -p 3330:3330 acumos-nexus3.acumos.org:10004/image_classifier:1

The docker run command includes host-to-container port mapping for port 3330, as
all Acumos model microservice images are configured to serve their protobuf
interfaces on HTTP port 3330. You can read about how Acumos uses the protobuf `in
the Acumos documentation <https://docs.acumos.org/en/latest/search.html?q=protobuf>`_.

To test the model, use the instructions provided by the model author to
setup the test app. For your models, this is a good test of whether the guide
you created works; note that others will need to rely upon the comprehensiveness,
correctness, and clarity of your instructions, just as you will rely upon theirs.

Test app documentation for each model should clarify how to configure the app
as needed to connect to the model microservice you are testing with.

Deploy Your Model in Azure
--------------------------

See the `Deploy Acumos Model to Azure User Guide <https://docs.acumos.org/en/latest/AcumosUser/portal-user/deployment/deploy-to-azure.html>`_.

Share Your Model with Other Developers
--------------------------------------

Instructions to be added.

Submit Your Model for Judging
-----------------------------

When you are ready to submit your model for judging, under "My Models":

* Select "Manage my model"
* Select "Publish to public marketplace"
* Complete any remaining metadata requirements as described under `Add Metadata for Your Model`_.
* Select "Submit to Publication"
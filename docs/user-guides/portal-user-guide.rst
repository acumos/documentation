
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

.. _portal-marketplace-user-guide-top:

=================================
Portal and Marketplace User Guide
=================================

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


It has the followingkey features:

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


Creating and Using an Account on Acumos
=======================================

Creating a User Account
-----------------------

In order to use the full capabilities of Acumos, users must create
an account on the Acumos Portal. The user may also complete a user profile.
Depending on the Acumos instance configuration, custom company login
options may be supported.

Account management capabilities are available in the upper right corner
of the user interface.

1. Click on Sign Up Now link on Acumos Home screen.

    .. image:: images/portal/signUpNow_link.png
        :width: 3.94653in
        :height: 2.30972in

2. Fill out information in Sign Up window.

    .. image:: images/portal/signUp_screen.png
       :width: 4.09653in
       :height: 2.40694in

3. Click Sign Up on the bottom of the screen.

4. You will be taken back to Acumos Home Screen.

    .. image:: images/portal/homeScreen.png
       :width: 4.42292in
       :height: 2.58889in

Logging into Acumos
-------------------

The steps to login to Acumos are as follows:

1. Click on the **sign in** link on the top right corner of the Home
   Page.

    .. image:: images/portal/signIn_screen.png
       :width: 5.12361in
       :height: 2.74306in

2. Fill in the username and password.

3. Click Sign in on the bottom of the screen.


Setting Profile and Notification Preferences
--------------------------------------------

Your User Profile is designed to give your users a view of your work,
interests and a quick reference to some of your other work. When you
publish a model, either to your Company instance or to the PUBLIC, your
profile is always available by clicking on your name.

    .. image:: images/portal/userProfile_screen.png
       :width: 3.48125in
       :height: 2.49236in

To set up your user profile, click on your name and choose **Account
Settings**.

    .. image:: images/portal/userProfile_setupScreen.png
       :width: 3.49375in
       :height: 2.87708in

From time to time, you may wish to be notified if a process, such has
requesting access to a model, has completed. To set up your notification
preferences, click on your name and choose **Account Settings, then
choose Notification Preferences**.

    .. image:: images/portal/accountSettingNotificationPrefs.png
       :width: 4.30069in
       :height: 2.76806in

Acumos Home
===========

Users are welcomed to Acumos on the home page, showing a carousel
highlighting Acumos features and uses. Other parts of the page show
featured or trending models, upcoming Acumos events and illustrations of
how Acumos can help customize solutions in many domains.

Note: Users do not need to be logged into Acumos or have an account to see the
Home and Marketplace pages but users must be logged in to download or deploy models.

Acumos Marketplace - For Consumers
==================================

The Acumos Marketplace is designed to make it easy to discover, explore,
and use AI models. In addition to displaying models from the local platform's catalog, the Public Markeplace can be configured to display models from peer Public Marketplaces. Users may view the details of a peer Model. However, users aren't able to work with, download, or deploy a peer Model without first requesting access to use that model. Public Marketplace peer relationships are set up and managed by the administrators of each Acumos instance. 


The Marketplace has three main views: 

- Company: The Company Marketplace only shows models which have been onboarded by local users and published to the local marketplace catalog
- Public: Models in the Public Marketplace are visible to all Acumos instances with a peer relationship
- ALL:  This choice displays models in both the user's Company and Public Marketplace

After you have used models on the Marketplace, you can share your experiences by using the comments and ratings capabilities on the Marketplace. 


Searching by Keyword for Models
-------------------------------

To search the Marketplace by keywords, follow these steps:

#. From the Main Menu, click on the Marketplace tab on the left so the
   Marketplace menu appears
#. Fill in the keyword search on the top left inner menu
#. Select the magnifying glass icon near the search box
#. The result of your query is shown – with only the models that meet
   your search criteria

    .. image:: images/portal/models_keywordSearch.png
       :width: 3.72639in
       :height: 2.20417in

Filtering by Category
---------------------

To search filter your view of the Marketplace by Category, follow these
steps:

#. From the Marketplace left inner menu, select **Show All** to show all
   categories
#. Click on a Category to select it
#. The screen is updated with only models that have your selected
   Category

    .. image:: images/portal/marketplace_categoryFiltering.png
       :width: 2.94306in
       :height: 2.24306in

Filtering by Tag
----------------

To search the Marketplace using Tags, follow these steps:

#. From the Marketplace left inner menu, click on the Tag of interest
#. The Tag will become highlighted
#. The screen is updated with only the models that have your selected
   tag

    .. image:: images/portal/marketplace_tagFiltering.png
       :width: 3.28542in
       :height: 2.15069in
       

Filtering by Peer
-----------------
To see models from federated peers, choose the PUBLIC marketplace. The
default view shows all public models from your local Acumos as well as
all models from all peers.

To restrict your view to a particular peer, or set of peers, adjust the
filters for Peer Catalog.

    .. image:: images/portal/models_federationBrowse.png
       :width: 3.47847in
       :height: 2.77222in


Accessing Peer Models
---------------------
A summary of the user journey for getting access to a peer model is
shown below. 

    .. image:: images/portal/models_federationJourney.png
       :width: 5.40208in
       :height: 3.59861in


.. _viewing-model-details:
Viewing Model Details
---------------------
Much more information about a model is available on a Model Details page. From the search results, clicking on any model image shows the Model Detail page for that model. Sections on the Model Detail page include:

- Introduction
- Ratings
- Comments
- Signatures:  the description of the model incoming data feed and output
- Documents: any supporting documentation the Modeler wishes to include
- Version History 

Most of the information on the detail page is contributed by the creator of the model to showcase the model and tell potential users about its capabilities and use. Ratings and Comments are contributed by other users of this model.  

Downloading a Model
-------------------

Logged-in users may download a model bundle from the Model Detail page.

    .. image:: images/portal/models_downloadFromMPJourney.png
       :width: 5.76528in
       :height: 3.76875in

The steps to download a model are as follows:

#. Select the Download button from the Model Detail page
#. Select the model file you wish to download. The bottom file is the
   complete zip file
#. Once the download is complete, it can be found in the local downloads
   folder

    .. image:: images/portal/models_downloadFromMPSteps.png
       :width: 4.94236in
       :height: 3.52292in


Deploying a Model
-----------------

Logged-in users may deploy a model's microservice to the Cloud of their choice.

#. Locate the Model Detail Page for the model of interest
#. Click on the **Deploy to Cloud** dropdown arrow and select the Cloud
   of your choice;  note: unsupported Clouds are disabled in the dropdown menu
#. In this example, select Azure
#. Complete the information in the detail pop-up
#. Click **Add** on the bottom right

    .. image:: images/portal/models_deployToCloudSteps.png
       :width: 5.24583in
       :height: 3.64167in
      

Converting a Model to be Used in ONAP
-------------------------------------

An overview of the user journey to discover and covert a model for use
in ONAP is shown below:

    .. image:: images/portal/models_onapJourney.png
       :width: 6.48819in
       :height: 4.01597in


Acumos Portal - For Modelers
============================

The Acumos Portal is designed to enable Modelers to easily onboard,
document, and package their AI models into reusable microservices.

A Modeler may test out the Acumos features in a personal
**private/unpublished** section of the Marketplace. Additionally, a Modeler may publish
the models to the Company Marketplace or to the Public Marketplace for wider distribution.

Modelers are typically subject-matter experts in their fields, so Acumos
models come from a wide range of domains and applications.

Models may be written in a number of popular programming languages or
toolkits, including TensorFlow and R.

Overview for Modelers
---------------------

All of the models that a user has onboarded can be viewed from the **My
Models** Page. Depending on their history, the models may exist in one
for four sections: MY UNPUBLISHED MODELS, MY MODELS: PUBLISHED TO COMPANY MARKETPLACE,
MY MODELS: PUBLISHED TO PUBLIC MARKETPLACE, and MY DELETED MODELS    .

Models published to Company are visible only to account holders on 
your local Acumos instance. This can be thought of as “inside the instance firewall” – typically viewable by
close collaborators. Models published to Public are available to outside
Acumos instances. The set of peers that may have access to Public models
is determined by your local Administrator.

Private/Unpublished models are visible only to the Modeler. However, a Modeler does
have the option to share a model with a specific user who has an account
on the same Acumos instance.

Onboarding Models
------------------

The Acumos onboarding process generates everything needed to create an executable microservice for your model and add it to the catalog.  Acumos uses Protobuf as a language-agnostic data format to provide a common description of the model data inputs and outputs. Any user may onboard a new model to their Company Aucmos instance. Users
can reach the Onboarding page from HOME, MARKETPLACE or side navigation.

A high-level summary of the onboarding steps and overview of the
workflow is shown below. 

    .. image:: images/portal/models_onboardingJourney.png
       :width: 4.74167in
       :height: 5.24375in

The onboarding process via web is accomplished by the following steps:

#. From the On-Boarding tab in the left navigation, or from My Models
   page, select **Add New Model**
#. Select Web On-boarding
#. Complete all the user steps to onboard your model, including:

    #. Choose Toolkit
    #. Select **Download client library**
    #. Select **Upload Model Bundle** and drag your file from the local
      machine to the screen and select **Done**
    #. Add a name for your model using the pencil icon
    #. All the steps have been done (you will see the number for each
      converted to a green check mark), the **Add to Catalog** button
      will be enabled
    #. Select **Add to Catalog.** This will initiate a series of back end
      process steps, illuminated as they run, by the cascade from left
      to right of the icons on the top of the page. These include
      uploading the model and artefacts, creating the microservice that
      will run in a docker container, creating a tosca file for your
      model so it can be used in the design studio, storing the
      artefacts and model and creating the link so you can access your
      model in the **private/unpublished** section of your personal
      catalog

    .. image:: images/portal/models_onboardingWeb.png
       :width: 4.94306in
       :height: 3.08125in


My Models Page
--------------

Users may view all the models they have uploaded by accessing the My
Models page.

Models are organized by their visibility to others on your **My Models**
page. They are sorted into the following sections: 

**MY UNPUBLISHED MODELS**
    Initially, successfully onboarded model will appear in my Models page in
    the UNPUBLISHED section. These are visible only to you and any
    collaborators of that model (shared). Partially onboarded models (in
    process) are also displayed in this section but are shown greyed out
    until the onboarding process is successfully completed.

**MY MODELS: PUBLISHED TO COMPANY MARKETPLACE**
    Models that have been published to Local, appear in the the LOCAL
    marketplace and are visible to anyone with an account on the local
    Acumos Instance.

**MY MODELS: PUBLISHED TO PUBLIC MARKETPLACE**
    Models that have been published to Public, appear in the the PUBLIC
    marketplace and may be viewed by users on Acumos instances that have a
    federated relationship with your local instance.

**MY DELETED MODELS**
    Initially, successfully onboarded model will appear in my Models page in
    the UNPUBLISHED section. These are visible only to the owner of that
    model and any collaborators of that model (via the "Share Model"
    process). Partially onboarded models (in process) are also displayed in
    this section but are shown greyed out until the onboarding process is
    successfully completed.

Clicking on any model image shows the Model Detail page for that model. See :ref:`viewing-model-details`.

Managing Your Model
-------------------
If a model has not been published, the Model Detail page may not show
very much information. To add a description, documents and details from the My Models page, click on any model image to show the Model Detail page for that model. From the Model Detail Page, click on the Manage My Model button at the top. A new page loads with MANAGEMENT OPTIONS on the left.


Share Model with Team
~~~~~~~~~~~~~~~~~~~~~

A Modeler can share a model with anyone who has an account on his/her local
Acumos. When you share a model with a collaborator, you make that Modeler a
co-owner of the model. This means they have all the same capabilities as
the original owner. An overview is shown below.

    .. image:: images/portal/models_shareWithTeamJourney.png
       :width: 6.48819in
       :height: 3.98403in

The steps to share are as follows:

1. First, select the "Share with Team" tab under "MANAGEMENT OPTIONS"

    .. image:: images/portal/models_shareWithTeamTab.png
       :width: 4.26806in
       :height: 2.02778in

2. Next, where you see "find a user to share with", type in the user ID
   of the person you wish to share with - you will need to get that user
   ID from them. The UI will show suggestions, based on the characters
   you have typed. Once you have located the correct person, select the
   SHARE button

    .. image:: images/portal/models_shareWithTeamScreen.png
       :width: 1.09028in
       :height: 1.80069in

3. Finally, the Sharing Popup will disappear and you can see that your
   model is shared and you have added them as a collaborator for that
   model. Click on each icon to see who you are currently sharing a
   model with

    .. image:: images/portal/models_shareWithTeamDone.png
       :width: 3.81736in
       :height: 2.16111in

The new collaborator will receive a notification that a new model has
been shared with him/her.

If you wish to remove the sharing rights from someone, simply click on
the small "X" next to his/her icon.

Publishing a Model 
~~~~~~~~~~~~~~~~~~~

Users may distribute their model by publishing it to either their 
Company Marketplace or to the Public Marketplace.

The presentation of the model may be different in each marketplace to
meet the needs of the different communities. For example, a user may
wish to provide company-specific details to their colleagues inside
their Company instance. This may include proprietary information,
documents or details that are only relevant to colleagues using the
Company instance. Information published to Company is contained within the
company firewall.

The Modeler may wish to present their model to the Public Marketplace in a more
general way, so it can be discovered and adapted for use by others.

Acumos provides two separate publishing workflows to meet this need.

There is a facility to simply use the same information if the publication information is the same for both marketplaces. . Also, publishing to
either marketplace can be done in any order. There is no requirement to
publish first to the Company marketplace. The same model can appear in
both catalogs.

Publishing to Company Marketplace
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The publishing process is summarized here.

    .. image:: images/portal/models_publishLocalJourney.png
       :width: 6.17014in
       :height: 3.81528in

Specific steps:

#. From the **My Models** page, select the model of interest, open the
   **Model Detail Page** and click on **Manage My Model** at the top
#. Select Publish to Company Marketplace
#. Click on Model Description and describe your model in terms that your
   users will understand and wish to use it
#. Click on Model Category. Select a Category and Toolkit type from the
   dropdown box
#. Select Model Documents and add any useful documents, such as release
   notes or detailed instructions that will help your users
#. Click on Model Tags. Either select one of the system tags or add your
   own. Any tags you add will become available for other users to select
   as well
#. You have completed the first step for publishing. Now click on
   **Submit for Publication**. This will launch a series of back end
   steps that will prepare your model for publication
#. The publishing workflow consists of several steps including checking
   for licences, and running a keyword and security scan. Some instances
   may require manual review
#. Once the publishing process is complete, all the workflow icons will
   be highlighted and the model will be available in the Company
   Marketplace

    .. image:: images/portal/models_publishLocalSteps.png
       :width: 5.24583in
       :height: 3.24306in

Publish to Public Marketplace
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Publishing to the Public Marketplace follows the same steps as Publish
to Company Marketplace.

The description and documentation may be different, as needed for a
different audience. If you wish to use the same presentation for the
Public model that you have previously published to Company, use the
checkbox to select that.

The Publishing back end process may be different for publishing to
Public. The required publication steps for each instance are configured
by the local Administrator.


Acumos Composition: Design Studio
=================================

The Design Studio is used to chain together multiple models,
along with data translation tools, filters and output adapters,
into a full end-to-end solution which can then be deployed into
any runtime environment.

An overview of the user journey for the Design Studio is shown below.

    .. image:: images/portal/models_compositeDesignStudioJourney.png
       :width: 6.49583in
       :height: 4.85833in

Please see the :ref:`_design-studio-user-guide-top` for details on how to use the Design Studio.





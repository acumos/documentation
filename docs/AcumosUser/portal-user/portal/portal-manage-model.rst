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

================
Managing a Model
================
The Model Detail page may not show very much information if the model has not 
been published. To add a description, documents and details, click on the **Manage My Model** button at the top. 

    .. image:: ../images/portal/models_manageMyModelBtn.png
       :width: 75%

A new page loads with MANAGEMENT OPTIONS on the left.

    .. image:: ../images/portal/models_manageMyModel.png
       :width: 75%


Sharing a Model with a Team
===========================

A Modeler can share a model with anyone who has an account on his/her local
Acumos. When you share a model with a collaborator, you make that Modeler a
co-owner of the model. This means they have all the same capabilities as
the original owner. An overview is shown below.

    .. image:: ../images/portal/models_shareWithTeamJourney.png
       :width: 75%


The steps to share are as follows:

1. First, select the **Share with Team** tab under **MANAGEMENT OPTIONS**

    .. image:: ../images/portal/models_shareWithTeamTab.png

2. Next, where you see **Find a user to Share with**, type in the user ID
   of the person with whom you wish to share. You will need to get that user
   ID from them. The UI will show suggestions based on the characters
   you have typed. Once you have located the correct person, select the
   **Share** button

    .. image:: ../images/portal/models_shareWithTeamScreen.png


3. The **Share with Team** will update. You will see that your
   model is shared and you have added collaborators. 

    .. image:: ../images/portal/models_shareWithTeamDone.png


The collaborator will receive a notification that a new model has
been shared with him/her.

Manage Authors
==============
Model owners have the ability to add the details of additional authors.

    .. image:: ../images/portal/models_manageAuthors.png

After you fill in the required fields, click **Add author**.


Publishing a Model
==================

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

There is a facility to simply use the same information if the publication information is the same for both marketplaces. Also, publishing to
either marketplace can be done in any order. There is no requirement to
publish first to the Company marketplace. The same model can appear in
both catalogs.

Publishing to the Company Marketplace
-------------------------------------

The publishing process is summarized here.

    .. image:: ../images/portal/models_publishLocalJourney.png


Specific steps:

#. From the **My Models** page, select the model of interest, open the
   **Model Detail Page** and click on **Manage My Model** at the top
#. Select Publish to Company Marketplace
#. Click on Model Description and describe your model in terms that your
   users will understand and wish to use it
#. Click on Model Category. Select a Category and Toolkit type from the
   dropdown box
#. Select **Model Documents** and add any useful documents, such as release
   notes or detailed instructions that will help your users
#. Click on **Model Tags**. Either select one of the system tags or add your
   own. Any tags you add will become available for other users to select
   as well.
#. You have completed the first step for publishing. Now click on
   **Submit for Publication**. This will launch a series of back end
   steps that will prepare your model for publication
#. The publishing workflow may consist of several steps configured by the Acumos Admin. Some instances
   may require manual review.
#. Once the publishing process is complete, all the workflow icons will
   be highlighted and the model will be available in the Company
   Marketplace

    .. image:: ../images/portal/models_publishLocalSteps.png


Publishing to the Public Marketplace
------------------------------------

Publishing to the Public Marketplace follows the same steps as Publish
to Company Marketplace except it requires the approval of a user who has the Publisher role.

The description and documentation may be different, as needed for a
different audience. If you wish to use the same presentation for the
Public model that you have previously published to Company, use the
checkbox to select that.

        .. image:: ../images/portal/models_publish-public.png
           :width: 75%

A modeler can also withdraw a model from publication by clicking on **Withdraw Request** from the **Publish To Public Marketplace** screen.

    .. image:: ../images/portal/models_publish-withdraw.png

Once approved by a Publisher, the model will be published to the Public Marketplace.
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

========
Overview
========

The Acumos Marketplace is designed to make it easy to discover, explore, and
use AI models. In addition to displaying models from the local platform's
catalog, the Public Marketplace can be configured to display models from peer
Public Marketplaces. Users may view the details of a peer Model. However, users
aren't able to work with, download, or deploy a peer Model without first
requesting access to use that model. Public Marketplace peer relationships are
set up and managed by the administrators of each Acumos instance.

The Marketplace only displays Public models to users who have not logged in.
There is no option to display models from marketplaces other than Public.

    .. image:: ../images/portal/marketplace_mainViewNotLoggedIn.png
       :width: 75%


The Marketplace has three main views to logged-in users:

- Company: The Company Marketplace only shows models which have been onboarded by local users and published to the local marketplace catalog
- Public: Models in the Public Marketplace are visible to all Acumos instances with a peer relationship
- ALL:  This choice displays models in both the user's Company and Public Marketplace

After you have used models on the Marketplace, you can share your experiences
by using the comments and ratings capabilities on the Marketplace.


    .. image:: ../images/portal/marketplace_mainViewLoggedIn.png
       :width: 75%


1) Select **Company** or **Public** to display models in those marketplaces, or select **ALL** to view models in both marketplaces
2) Select an option from the **Sort By** drop down to sort the displayed models
3) Select one or more checkboxes to **Filter By Category**; clicking the **Show All** link display additional categories if they exist; see the `Filtering by Category`_ section for details
4) Change from grid view to list view by selecting the corresponding icon
5) Select an option from the **Showing** drop down to change the number of models displayed on a page
6) Page navigation
7) Click the **Manage Themes** link to select, update, or remove your tag choices; see the `Manage Themes`_ section below for instructions

    7a) Select a **tag** to filter the displayed models by tag; see the `Filtering by Tag`_ section for details

8) Click a model's image to access the **Model Detail** page
9) **SITE ADMIN** and **PUBLISH REQUEST** are menu items only available to users with those roles
10) Model search; see the `Searching by Keyword`_ section for details
11) Click the **Bell** icon to review your :doc:`notifications <../portal/portal-notifications>`
12) Click the down arrow next to your name to access **Account Settings** and **Manage Themes**
13) **Help** and **Log Out**


Manage Themes
=============
Themes in this context refers to which types of models should be displayed
before the rest. Themes equate to tags that have been associated with models.
All the model tags are displayed initially in the **Manage Themes** window.

    .. image:: ../images/portal/themes_defaultView.png


1) You can type in the **Filter** field to narrow the displayed list

    .. image:: ../images/portal/themes_selectTheme.png

2) Select the themes that interest you
3) Press **Continue** and then in the following window, press **Done** to save your changes

Preferred themes are displayed on the left side of the UI.

     .. image:: ../images/portal/themes_preferredThemes.png

**Manage Themes** may also be accessed from User drop-down in the upper right corner of the UI.

    .. image:: ../images/portal/themes_accountThemes.png


Searching by Keyword
====================
To search the Marketplace by keywords, follow these steps:

#. Fill in the keyword search on the top left inner menu
#. Select the magnifying glass icon near the search box
#. The result of your query is shown – with only the models that meet
   your search criteria

Filtering by Category
=====================
To filter your view of the Marketplace by Category, follow these
steps:

1. From the Marketplace left inner menu, select **Show All** to show all
   categories
2. Click on a Category to select it
3. The screen is updated with only models that have your selected
   Category

Filtering by Tag
================

To search the Marketplace using Tags, follow these steps:

1. From the Marketplace left inner menu, click on the Tag of interest
2. The Tag will become highlighted
3. The screen is updated with only the models that have your selected
   tag

Filtering by Peer
=================
To see models from federated peers, choose the PUBLIC marketplace. The default
view shows all public models from your local Acumos as well as all models from
all peers. This functionality is only available if your Acumos installation has
been connected to other Acumos installations.

To restrict your view to a particular peer, or set of peers, adjust the
filters for Peer Catalog.

    .. image:: ../images/portal/models_federationBrowse.png
       :width: 75%
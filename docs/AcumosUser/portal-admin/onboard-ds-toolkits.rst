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

========================================
On-Boarding Design Studio Toolkit Models
========================================

The Design Studio requires specific toolkit models to be onboarded in order for Data Broker, Generic Data Mapper, Splitter, and Collator functionality to be enabled.

On-boarding the Models
---------------------

#. Download the following archived model bundles from the Design Studio `wiki <https://wiki.acumos.org/display/DS#DesignStudioHome-ToolKitModels>`_ page:

    - Collator.zip
    - Splitter.zip
    - DataBroker.zip
    - DataMapper.zip

#. Each zip file is a model that needs to be on-boarded; follow the :doc:`web on-boarding <../portal-user/portal/portal-onboarding-web>`_ instructions to upload the models.

Publishing the Models
---------------------
All the models should be published to the Company marketplace. Each model needs to have Model Category and Toolkit Type set. See the *Publishing to the Company Marketplace* section of the :doc:`../portal-user/portal/portal-manage-model` page in the Portal and Marketplace User Guide for instructions.

.. csv-table::
    :header: "Model", "Model Category", "Toolkit Type"
    :align: left

    Collator, Data Transformation, Collator
    Data Broker, Data Sources, Data Broker
    Generic Data Mapper, Data Transfer, ..
    Splitter, Data Transformation, Splitter



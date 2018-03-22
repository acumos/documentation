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

==========================
Acumos R Client User Guide
==========================

The Acumos R Client library code is maintained by Simon Urbanek at RForge. Please check RForge for the most up-to-date instructions!

Overview
========
R is a language for statistical programming that is a popular choice for machine learning applications. It provides a wide variety of data analytic tools and models. Due to its vectorized nature, it is also very efficient at dealing with moderately sized data.

Prerequisites
=============
Before you begin:

#. You must have protobuf 3 installed. Please visit the protobuf repository for more information on how to install protoc. Install version 3 (version 2 will not work).
#. Your onboarding url is:   XYZ .  Use this url in place of the default url:

.. code-block:: bash

    api='http://localhost:8887/v2/models', name='(undefined)'


Installation
============
The  install package is available here:

.. code-block:: bash

    install.packages("acumos",,c("http://r.research.att.com","http://rforge.net"))


You need to install all dependent packages from CRAN first.

Usage
=====
Create a Component
------------------

To create a deployment component, use acumos::compose() with the functions to expose. If type specs are not defined, they default to c(x="character").
The component consists of component.json defining the component and its metadata, component.bin the binary payload and component.proto with the protobuf specs.
Please consult R documentation page for details, i.e., use ?compose in R or see the `Compose <http://www.rforge.net/doc/packages/acumos/compose.html>`_ page at RForge.

Deploy a Component
------------------
 
To run the component you have to create a runtime.json file with at least {"input_port":8100} or similar to define which port the component should listen to. If there are output components there should also be a "output_url" entry to specify where to send the result to. It can be either a single entry or a list if the results are to be sent to multiple components. Example:

.. code-block:: bash

    {"input_port":8100, "output_url":"http://127.0.0.1:8101/predict"}


With the component files plus runtime.json in place, the component can be run using

.. code-block:: bash

    R -e 'acumos:::run()'


The run() function can be configured to set the component directory and/or locations of the component files if needed. If you don't want to create a file, the runtime parameter also accepts the runtime structure, so you can also use

.. code-block:: bash

    R -e 'acumos:::run(runtime=list(input_port=8100, output_url="http://127.0.0.1:8101/predict"))'


Details: ?run in R or see the `Run <http://www.rforge.net/doc/packages/acumos/run.html>`_ page at RForge.

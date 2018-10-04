.. ===============LICENSE_START=======================================================
.. Acumos CC-BY-4.0
.. ===================================================================================
.. Copyright (C) 2018 <YOUR COMPANY NAME>. All rights reserved.
.. ===================================================================================
.. This Acumos documentation file is distributed by <YOUR COMPANY NAME>
.. under the Creative Commons Attribution 4.0 International License (the "License");
.. you may not use this file except in compliance with the License.
.. You may obtain a copy of the License at
..
..      http://creativecommons.org/licenses/by/4.0
..
.. This file is distributed on an "AS IS" BASIS,
.. WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
.. See the License for the specific language governing permissions and
.. limitations under the License.
.. ===============LICENSE_END=========================================================
.. PLEASE REMEMBER TO UPDATE THE LICENSE ABOVE WITH YOUR COMPANY NAME AND THE CORRECT YEAR

.. _api-docs-template:

==================================
Application Programming Interfaces
==================================

Document the key things a developer needs to know about your component's APIs. For some components,
there will only be one logical grouping of APIs. For others there may be more than one grouping.

API Group 1
===========

Provide a description of what the API does and some examples of how to
use it.

API Group 2
===========

Provide a description of what the API does and some examples of how to
use it.

Including a Swagger File
========================
Acumos uses `Swagger <https://swagger.io/>`_ to generate dynamic API docs. However, to read the docs you must have access to the Swagger server running on your Acumos instance. This can be inconvenient, so the Docs project uses a Sphinx plugin called `sphinx-swaggerdoc <https://github.com/unaguil/sphinx-swaggerdoc/>`_, which provides an RST directive to render a ``swagger.json`` file. The sphinx-swaggerdoc extension is defined in the Documentation project's ``conf.py`` file.

You an include your API JSON file either by pointing to a URL or by pointing to a file. This example uses a local file called ``example-swagger.json``.  See the `sphinx-swaggerdoc <https://github.com/unaguil/sphinx-swaggerdoc/>`_ for more examples.

.. code:: restructuredtext

    .. swaggerv2doc:: example-swagger.json


Example of Rendered Content From api-docs.json File
===================================================

`https://docs.acumos.org/en/latest/docs-contributor-guide/templates/swaggerv2doc-example-output.html <https://docs.acumos.org/en/latest/docs-contributor-guide/templates/swaggerv2doc-example-output.html>`_

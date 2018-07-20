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
Documenting APIs
================

Acumos uses `Swagger <https://swagger.io/>`_ to generate dynamic API docs. However, to read the docs you must have access to the Swagger server running on your Acumos instance. This can be inconvenient, so the Docs project uses a Sphinx plugin called `sphinx-swaggerdoc <https://github.com/unaguil/sphinx-swaggerdoc/>`_, which provides an RST directive to render a ``swagger.json`` file. The sphinx-swaggerdoc extension is defined in the Documentation project's ``conf.py`` file.

You an include your API JSON file either by pointing to a URL or by pointing to a file. This example uses a local file called ``ccds-api-docs.json``.  See the `sphinx-swaggerdoc <https://github.com/unaguil/sphinx-swaggerdoc/>`_ for more examples.

.. code:: restructuredtext

    .. swaggerv2doc:: ccds-api-docs.json

See the :ref:`swaggerv2doc-example-output` page for an example of output from the JSON file.

Guidelines for Documenting Project APIs
=======================================

Each project should create a file called ``api-docs.rst`` and add that file to the project's ``index.rst`` file.



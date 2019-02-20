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
On-Boarding a Python Model
==========================

.. note::
    Python Client v0.7.0 was tested with the Acumos Athena platform release

The Acumos Python Client library is required for users who want to push their
TensorFlow and scikit-learn models to the Acumos Portal. You will use this
library for on-boarding all your models. The library creates meta-data by
introspection, packages all the necessary information, and then uploads it to
Acumos On-Boarding server. The Acumos Python Client library is packaged an
available on PyPI. Please see the `PyPI <https://pypi.org/project/acumos/>`_
page for instructions and a tutorial.

To better know how to on-board a model using the  Web interface,
please have a look at the :doc:`Web Onboarding page <portal-onboarding-web>`

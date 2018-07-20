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


=====================================
RST vs the Wiki - Which Docs Go Where
=====================================

Frequently, developers ask where documentation should be created. Should they always use reStructuredText/Sphinx? Not necessarily. Is the wiki appropriate for anything at all? Yes.

It’s really up to the development team. Here is a simple rule:

The more tightly coupled the documentation is to a particular version of the code, the more likely it is that it should be stored with the code in reStructuredText.

Two examples on opposite ends of the spectrum:

Example 1: API documentation is often stored literally as code in the form of formatted comment sections. This would be an ideal choice for reStructuredText stored in a doc repo.

Example 2: Meeting notes, release plans -- the wiki would be a better choice for this.

    .. image:: images/doc-places.png

The Docs team encourages component teams to store as much documentation as reStructuredText as possible because:

    #. The Docs team can more easily edit component documentation for grammar, spelling, clarity, and consistency
    #. A consistent formatting syntax across components will allow the doc team more flexibility in producing different kinds of output
    #. The documentation can easily be reorganized
    #. Wiki articles tend to grow stale over time as the people who write them change positions or projects
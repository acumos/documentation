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

====================
Component Docs Guide
====================
In the past, standard documentation methods included ad-hoc Word documents,
PDFs, poorly organized wikis, and other, often closed, tools like Adobe
FrameMaker. The rise of DevOps, Agile, and Continuous Integration, however,
created a paradigm shift for those who care about documentation because:

1. Documentation must be tightly coupled with code/product releases. In many
cases, particularly with open-source products, many different versions of the
same code can be installed in various production environments. DevOps personnel
must have access to the correct version of documentation.

2. Resources are often tight, volunteers scarce. With a large software base
like Acumos, a small team of technical writers, even if they are also
developers, cannot keep up with a constantly changing, large code base.
Therefore, those closest to the code should document it as best they can, and
let professional writers edit for style, grammar, and consistency.

Plain-text formatting syntaxes, such as reStructuredText (RST), are a good
choice for documentation because:

	#. They are editor agnostic
	#. The source is nearly as easy to read as the rendered text
	#. Documentation can be treated exactly as source code is treated
	#. Shallow learning curve

The Documentation team chose reStructuredText largely because of `Sphinx
<http://www.sphinx-doc.org/>`_, a Python-based documentation build system,
which uses `reStructuredText <http://docutils.sourceforge.net/rst.html/>`_
natively. In a code base as large as Acumos', cross-referencing between
component documentation was deemed critical. Sphinx and reStructuredText have
built-in functionality that makes collating and cross-referencing component
documentation easier.

The Sphinx version is defined in ```documentation/etc/requirements.txt```.

RST vs the Wiki - Which Docs Go Where
=====================================

Frequently, developers ask where documentation should be created. Should they
always use reStructuredText/Sphinx? Not necessarily. Is the wiki appropriate
for anything at all? Yes.

It’s really up to the development team. Here is a simple rule:

The more tightly coupled the documentation is to a particular version of the
code, the more likely it is that it should be stored with the code in
reStructuredText.

Two examples on opposite ends of the spectrum:

Example 1: API documentation is often stored literally as code in the form of
formatted comment sections. This would be an ideal choice for reStructuredText
stored in a docs repo.

Example 2: Meeting notes, release plans -- the wiki would be a better choice
for this.

    .. image:: images/doc-places.png

The Docs team encourages component teams to store as much documentation as
reStructuredText as possible because:

    #. The Docs team can more easily edit component documentation for grammar, spelling, clarity, and consistency
    #. A consistent formatting syntax across components will allow the doc team more flexibility in producing different kinds of output
    #. The documentation can easily be reorganized
    #. Wiki articles tend to grow stale over time as the people who write them change positions or projects

RST Tools and Resources
=======================
For detailed information ReStructuredText and how to best use the format, see:

    #. `RST Primer <http://docutils.sourceforge.net/docs/user/rst/quickstart.html>`_
    #. `RST Quick Reference <http://docutils.sourceforge.net/docs/user/rst/quickref.html>`_
    #. `RST Directives <http://docutils.sourceforge.net/docs/ref/rst/directives.html>`_
    #. `RST Cheatsheet <http://docutils.sourceforge.net/docs/user/rst/cheatsheet.txt>`_


A list of RST tools is available on the :ref:`rst-tools` page.

Component Docs Structure
========================
Each component should have a docs folder with a minimum of:

    .. image:: images/docs-structure.png

Required Files
--------------
#. ``index.rst`` is the table of contents
#. ``release-notes.rst`` contains the release notes for the component
#. ``developer-guide.rst`` contains information that a developer needs to know in order to work on the component

    #. this should be very technical, aimed at people who want to help develop the components
    #. this should be how the component does what it does, not a requirements document of what the component should do
    #. this should contain what language(s) and frameworks are used, with versions
    #. this should contain how to obtain the code, where to look at work items (Jira tickets), how to get started developing

#. ``api-docs.rst`` contains details on the component's API

Note: images/design.png would be an architeture diagram in PNG format; this image would be included in the developer-guide.rst

Optional Files
--------------
#. ``user-guide.rst`` contains information on how to use and configure the
component; most components will not have a user guide

    #. if the guide contains sections on third-party tools, is it clearly stated why the Acumos platform is using those tools? are there instructions on how to install and configure each tool/toolset?
    #. does the guide state who the target users are? for example, modeler/data scientist, Acumos platform admin, marketplace user, design studio end user, etc
    #. if there are instructions, they are clear, correct, and fit for purpose
    #. does the guide contain information more suited for a different guide?
    #. a user guide should be how to use the component or system; it should not be a requirements document
    #. a user guide should contain configuration, administration, management, using, and troubleshooting sections for the feature.

Templates
---------
Templates are available in the documentation project under docs/docs-contributor-guide/templates.
You can clone the documentation project or download the templates from `Github <https://github.com/acumos/documentation/tree/master/docs/docs-contributor-guide>`_.

Current list of templates:

    #. api-docs.rst
    #. developer-guide.rst
    #. index.rst
    #. install-guide.rst
    #. release-notes.rst
    #. user-guide.rst

The templates themselves also contain guidance on what topics to include in the contents.
**Please read the contents of the templates!**


Writing Guidelines
==================
Following these writing guidelines will keep Acumos documentation consistent
and readable. Only a few areas are covered below, as we don’t want to make it
too complex. You can't go wrong keeping things simple and clear.

Don’t get too hung up on using correct style. We’d rather have you submit
good information that doesn’t conform to this guide than no information at
all. Acumos’ Documentation project team will be happy to help you with the
prose.

General Guidelines for All Documents
------------------------------------

    #. Use standard American English and spelling
    #. Use consistent terminology
    #. Write in the active voice, using present simple tense when possible
    #. Write objective, professional content
    #. Keep sentences and paragraphs short and clear
    #. Use a spell checker


Abbreviations and Acronyms
--------------------------
Write out the term the first time it appears in the document, immediately
followed by the acronym or abbreviation in parentheses, i.e. ReStructuredText
(RST). Then use the acronym in the rest of the document. In diagrams, if space
allows, write out the full term.
Use “an” before an acronym that begins with a vowel sound when spoken
aloud; use “a” before an acronym that begins with a consonant sound when
spoken aloud. Examples: an RST file, a PMML file.


GUI Elements
------------
In general, write menu names as they appear in the UI. For example, if a menu
or item name is all caps, then write it all caps in the document.


Headings (Titles)
-----------------

    #. Use brief, but specific, informative titles
    #. Use capitalization; do not end with a period or colon
    #. Use a gerund to begin section titles if it makes sense. Examples: Configuring, Managing, Starting
    #. Use descriptive titles for tables and figures titles; do not number tables or figures; do not (in general) add titles for screen shots


Headings in RST
---------------
Below is an example of how to denote headings of various levels in RST.

.. code:: RST

    ==============
    Document Title
    ==============
    -----------------
    Document Subtitle
    -----------------

    Section 1 Title
    ===============

    Section 1.1 Title
    -----------------

    Section 1.1.1 Title
    ~~~~~~~~~~~~~~~~~~~

    Section 1.1.1.1 Title
    ^^^^^^^^^^^^^^^^^^^^^

    Section 1.1.1.1.1 Title
    '''''''''''''''''''''''

    Section 1.1.1.1.2 Title
    '''''''''''''''''''''''

    Section 1.2 Title
    -----------------

    Section 1.2.1 Title
    ~~~~~~~~~~~~~~~~~~~

    Section 1.2.2 Title
    ~~~~~~~~~~~~~~~~~~~

    Section 2 Title
    ===============


Task(s)
-------
    #. Start task titles with an action word. Examples: Create, Add, Validate, Update.
    #. Use [Optional] at the beginning of an optional step.
    #. Provide information on the expected outcome of a step, especially when it is not obvious.
    #. Break down end-to-end tasks into manageable chunks.

Including Design Diagrams and Images
------------------------------------
The `developer-guide.rst template <https://raw.githubusercontent.com/acumos/documentation/master/docs/docs-contributor-guide/templates/developer-guide.rst>`_ contains information and examples on how to incorporate design diagrams in your guide.
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

=================================
RST (reStructuredText) and Sphinx
=================================

In the past, standard documentation methods included ad-hoc Word documents, PDFs, poorly organized wikis, and other, often closed, tools like Adobe FrameMaker. The rise of DevOps, Agile, and Continuous Integration, however, created a paradigm shift for those who care about documentation because:

1. Documentation must be tightly coupled with code/product releases. In many cases, particularly with open-source products, many different versions of the same code can be installed in various production environments. DevOps personnel must have access to the correct version of documentation.

2. Resources are often tight, volunteers scarce. With a large software base like Acumos, a small team of technical writers, even if they are also developers, cannot keep up with a constantly changing, large code base. Therefore, those closest to the code should document it as best they can, and let professional writers edit for style, grammar, and consistency.

Plain-text formatting syntaxes, such as reStructuredText, Markdown, and Textile, are a good choice for documentation because:

	#. They are editor agnostic
	#. The source is nearly as easy to read as the rendered text
	#. Documentation can be treated exactly as source code is (e.g. versioned, diff’ed, associated with commit messages that can be included in rendered docs)
	#. Shallow learning curve

The Documentation team chose reStructuredText largely because of `Sphinx <http://www.sphinx-doc.org/>`_, a Python-based documentation build system, which uses `reStructuredText <http://docutils.sourceforge.net/rst.html/>`_ natively. In a code base as large as Acumos', cross-referencing between component documentation was deemed critical. Sphinx and reStructuredText have built-in functionality that makes collating and cross-referencing component documentation easier.

Sphinx Version
==============
The Sphinx version is defined in ```documentation/etc/requirements.txt```. We use version 1.6.7
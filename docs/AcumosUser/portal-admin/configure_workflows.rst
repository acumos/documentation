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

.. _configure-workflows:

===================
Configure Workflows
===================

A number of Acumos tasks, such as on-boarding and publishing require the
user to complete a series of tasks and then initiate a back-end workflow
to complete the overall task. The workflow can be described as a series
of steps, all of which must succeed to complete the overall task.

The Admin of a Acumos system may include or omit steps from the back-end
workflow to customize their local instance.

UI for Workflow Configuration
=============================

When “Configure Workflows” is selected, the current set of workflows and
currently configured steps is displayed. When the Acumos portal is
deployed, this will include the system default workflows for
“On-boarding”, “Publishing to Local”, “Publishing To Public” and “Import
Federated Model Work”, e.g. as below. Options from here:

-  Deactivate or Assign any workflow

-  Modify any workflow, by adding or deleting optional steps

   -  Grayed-out steps are mandatory and cannot be deleted or modified

   -  Optional steps have a “bar-in-circle” icon (|Delete-step|) which
      enables the step to be deleted, e.g. the Security Scan step as
      optional for the Onboarding work flow

    .. |Delete-step| image:: images/admin-delete-bar.png


    .. image:: images/admin-workflows.png

Example: Change workflow for On-boarding
----------------------------------------

Select the correct workflow and choose the EDIT button.

    .. image:: images/admin-workflow-edit.png

The detailed steps are shown, including the optional SECURITY step. If
the SECURITY step is currently not included, and Admin wishes to add it,
they click on the **+** symbol for that step.

Adding a Security Step:

    .. image:: images/admin-workflow-step-add.png

Deleting a Security Step: Click on the **“-“** button”.

    .. image:: images/admin-workflow-step-delete.png

Result: The new security step is shown in the workflow. To implement
the change, the Admin must select **Assign Workflow** button.

    .. image:: images/admin-workflow-assign.png

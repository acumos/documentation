.. ===============LICENSE_START=======================================================
.. Acumos
.. ===================================================================================
.. Copyright (C) 2017-2018 AT&T Intellectual Property & Tech Mahindra. All rights reserved.
.. ===================================================================================
.. This Acumos documentation file is distributed by AT&T and Tech Mahindra
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

===================================
Message Splitter and Collator Tools
===================================
The Splitter and Collator functionality supports the `Directed Acyclic Graph
(DAG)
<https://cran.r-project.org/web/packages/ggdag/vignettes/intro-to-dags.html>`_
Topology in the Design Studio, supports both the split and join semantics, and
provides the  different collation semantics at join point.

.. note::
    The Splitter and Collator require that specific "Data Transformation & Toolkit" models be onboarded in order for the functionality to be enabled. If you do not see a Collator and a Splitter in the **Data Transform Tools** palette, your Acumos instance does not support Splitter and Collator functionality.

The Splitter
============
The Splitter enables connecting one model to multiple models to support message
splitting (broadcast and parameter splitting capability). The Splitter supports
Copy-Based and Parameter-Based schemes.

The Splitter has the following features:

* Selectable splitting schemes
* Accept a single input message and produces multiple output messages of the same or different type, depending upon the splitting scheme
* The number of outputs is determined dynamically at run time
* The input port supports a single incoming link
* The output port can support one or more outgoing links in case the output message has a subset of input parameters
* Supports the addition and deletion of its input links and its output link
* Performs: 1) unmarshalling of input protobuf message into native format; 2) splitting of the unmarshalled message according to the splitting scheme selected by the user; and 3) marshalling the output messages back into Protobuf format before sending on its output port

The Collator
============
The Collator enables connecting multiple models and combining the input from the models into a single output message. The Collator supports Array-Based and Parameter-Based collation.

The Collator has the following features:

* Selectable collation schemes
* Accept a variable number of inputs (N) and produces a single output
* The number of inputs is determined dynamically at run time
* The input port can support one or more incoming links in case the output message has a subset of input parameters provided by one incoming link
* The output port will support only one outgoing link
* Collator will support the addition and deletion of its input links and its output link
* Performs: 1)unmarshalling of input protobuf messages into native format; 2) collation of unmarshalled messages according to the collation scheme selected by the user; and 3) marshalling the collated message back into Protobuf format before sending on its output port.

Using the Splitter
==================
Splitters are located in the **Data Transform Tools** palette.

    .. image:: ../images/design-studio/split-join/COandSPL.jpg


#. Create/load a solution
#. Select a Splitter from the list in the **Data Transform Tools** palette and drag onto the canvas
#. After dragging the Splitter on the canvas, it should be displayed as rectangular icon and the input (on left-hand side) and output (on right-hand side) ports should be disabled

    .. image:: ../images/design-studio/split-join/SplitterAfterDrag.jpg

#. On the right hand side in properties box, there will be a **Splitter Scheme Selector** button; click on it to display the pop-up window for scheme selection

	.. image:: ../images/design-studio/split-join/SplitterSelection.jpg

Copy-Based Splitting
--------------------
The user will be able to establish a link to Splitter ports only after
selecting the splitter scheme and Send (copy) the input message on all outgoing
links. Make sure that both input and output message signatures are identical
and both the input and output message data is same. The "Splitter Map" button
(present in the properties panel) **will not be enabled** as it copies the
complete message from the source model to all the target models connected to
the Splitter. As it is a copy-based splitting, if either input or output port
is connected to a ML model, it acquires the message signature from the ML model
on both the input and output ports.

    .. image:: ../images/design-studio/split-join/CopyBasedSPLwithModels.jpg

Connecting the Splitter Input Port First
........................................
If the input port of the Splitter is connected first to the output port of the (producing) Model, then:

* Splitter must display the message signature of the output port of the producing model on its input port.
* When the output ports are connected later on, Splitter must make sure that all output messages have the same message signature as the message signature of the input message, otherwise the connection should not be allowed.

Connecting the Splitter Output Port First
.........................................
If the output port of the Splitter is connected first, then:

* The Splitter should allow the first outgoing link to be connected to its output port without any validation, and make a temporary copy of its message signature.
* For the second and subsequent links that are connected to the output port, the Splitter must make sure that their message signature is the same as that of the first message signature, otherwise the connection should not be allowed.
* When the input port is connected later on, the Splitter must make sure that its message signature is the same as that of output message signature on its output port, otherwise the connection should not be allowed.

Validation Rules
................
* May have one or more links connected at its output port (Note: The case of one link at the output port does not make sense but is allowed.)
* May have only one link connected at its input port
* Must have the same message signature for messages coming out of its output port into all the outgoing links
* The message signature at the input and output port of the Splitter must be the same
* The output of a Splitter cannot be connected to the input of a Collator

Parameter-Based Splitting
-------------------------
Split the input message based on its signature into (top – level) parameters
and send different parts / parameters on different outgoing links. Make sure
that Input and output message signatures are different and the collection
(i.e., specific arrangement) of output message signatures represents the input
message signature. The "Splitter Map" button **will be enabled**. The user must
connect one model at the input and one or more models at the output port of the
splitter. Once the input and output ports are connected, the source and target
tables are auto populated that can be viewed when the user clicks on Splitter
map button.

    .. image:: ../images/design-studio/split-join/ParameterBasedSPLWithModel.jpg

There is a mapping area in the Splitter Map pop-up that allows the user to copy
a source field (parameter) to the target field(s) (parameter(s)). It is a drop
down having all the source table tags. All the target-side fields must be
mapped for a successful validation. At least one source field should be mapped
to a target field. A source field may be mapped to multiple target fields.


For every mapping, there is an Error Validator that helps the user know if the
mapping is valid or invalid (i,e. if the parameter types on both sides match).


    .. image:: ../images/design-studio/split-join/SplitterMappingDetailsValid.jpg

If any of the mapping is invalid, then validation and blueprint generation will fail.

    .. image:: ../images/design-studio/split-join/SplitterMappingDetailsError.jpg

Connecting the Splitter Input Port First
........................................
If the input port of the Splitter is connected first to the output port of the (producing) Model, then:

* Splitter must display the message signature of the output port of the producing model on its input port
* When the output port is connected later on, Splitter’s output port should remain ANY

Connecting the Splitter Output Port First
.........................................
If the output port of the Splitter is connected first, then:

* The Splitter should allow all the outgoing link(s) to be connected to its output port without any validation
* When the input port is connected later on, the Splitter should allow only one incoming link to be connected to its input port without any message signature validation

The parameter-based splitter should split the input message into first-level
parameters and Copy the required input parameters on each of its outgoing link
based on the information in the Splitter Map. Arrange these parameters in
a sequence based on the parameter ordering information in the message signature
on that outgoing link. The Splitter should aggregate all parameters that needs to be
sent to a single target in a single message. The Parameter–based Splitter
should perform binary-to-native format conversion before collation and native
to binary conversion after collation.

Validation Rules
................

* The Splitter allows a mapping between a pair of source and target parameters only if their message signatures match, otherwise an error should be indicated in the mapping area to allow the user to correct it.
* A parameter on the source side may be mapped to more than one parameter/tag on the target side as long as target parameters belong to different target models
* Two or more parameters from the source cannot be mapped to the same parameter/tag in the target message
* When no parameters from the source are mapped to the parameters on the target message, then the Splitter displays an error until the source model is deleted or at least one of the source side parameters is mapped to a target side parameter
* All parameters on the target side models must be mapped to their matching source side parameters, otherwise an error is shown in the mapping area until this condition is satisfied
* When both the source and target side parameters have been mapped correctly, no errors are displayed
* The Splitter input port may have only one incoming link
* The Splitter output port can have one or more outgoing links (a single outgoing link case is possible if this link provides all parameters required by the single target model.)


Using the Collator
==================

#. Create/load a solution
#. Select a Collator from the list in the **Data Transform Tools** palette and drag onto the canvas
#. After dragging the Collator on the canvas, it is displayed as rectangular icon and the input (on left hand side) and output (on right hand side) ports should be disabled

    .. image:: ../images/design-studio/split-join/CollatorAfterDrag.jpg

#. On the right hand side in properties box, there will be a Collator Scheme Selector; click on it to display the pop-up window for scheme selection

    .. image:: ../images/design-studio/split-join/CollatorSelectionSchema.jpg

Array-Based Collation
---------------------
Each incoming link provides complete message data, output the collection (an
array) of all input message data. Each input message signature is the same, but
message content (data) may be different and the output message signature is a
collection (i.e., an array, or a repeated structure) of input message
signatures. The Collator Map button **will not be enabled**. The output port
of Collator only connects to a model which has a repeated complex message
signature of the message at the input port (i.e., if the message signature at
input port is "M", the message signature of the output port is "repeated (M)".
**All** links connected to the input port must carry the same message signature
"M". That means the output message signature is an array of input message
signature (on the input links) which are of same message type. If either of one
of the input or the output  port of the Collator is connected to an ML Model,
then the input port acquire the message signature "M" and the output port
acquires the message signature "repeated(M)".

    .. image:: ../images/design-studio/split-join/ArrayBasedCollatorWithModels.jpg

The Collator waits until all messages are received on all of its input ports,
based on the incoming link information in the CDUMP file. When all the messages
have been received, the Collator should convert the binary messages into native
format and construct an array of the input messages.Collator should convert the
array of input messages into a protobuf repeated message structure before
delivering it on the output port.

Connecting the Collator Output Port First
.........................................
If the output port of the Collator is connected first to the input port of the (consuming) Model, then:

* Collator displays the message signature of the input port of the consuming model on its output port; note that this will be a repeated Protobuf data type
* When the input ports are connected (later on), the Collator makes sure that all input messages have the same message signature as message signature of the output message except that input should not be a repeated type

Connecting the Input Port First
...............................
If the input port of the Collator is connected first, then:

* The Collator allow the first incoming link to be connected to its input port without any validation and makes a temporary copy of its message signature.
* For the second and subsequent links that are connected to the input port, the Collator makes sure that the message signature is the same as that of the first message signature, otherwise the connection is not be allowed
* When the output port is connected later on, the Collator makes sure that its message signature is the same as that of repeated (input message signature), otherwise the connection is not be allowed

Validation Rules
................
* An array – based collator can have one or more links connected at its input port; note: in case of a single input link the user may want to convert a Model’s output message into an “array of message” structure before feeding it to the target model which only accepts an array structure
* The Collator can have only one link connected at its output port
* The array-based collator must have the same message signature for messages arriving at its input port from all the incoming links
* The output port of an array based collator must have a “repeated” structure of the message signature of its incoming links
* The output of a Collator cannot be connected to the input of a Splitter


Parameter-Based Collation
-------------------------
If a Parameter-based collation scheme is selected, the Collator Map button
**will be enabled**. The user must connect one model at the output port and one
or more models at the input port. Once the input and output ports are
connected, the source and target tables are auto-populated and can be viewed by
clicking on the Collator map button. As it is parameter-based collation,
Collator output port acquires the message signature of the input port of the ML
model connected to it and collator input port remains "ANY" which means any can
be connected to it.

    .. image:: ../images/design-studio/split-join/ParameterBasedCOWithModels.jpg

There is a mapping area in the Collator Map pop up, which allows the user to
map (i.e., copy) a source field to a target field. It is a drop down having all
the target table tags. All the Target side fields must be mapped for a
successful validation. At least one field from each source should be mapped to
a target field, otherwise a validation error is displayed. Multiple source
fields cannot be mapped to the same target field. A source field cannot be
mapped to more than one target field.

For every mapping, there is a error validator that helps the user know if the
mapping is valid or invalid (i,e. if the parameter types on both sides match).
If any of the mapping is invalid, then validation and blueprint generation will
fail.

Validation Errors
    .. image:: ../images/design-studio/split-join/CollatorMappingDetailsError.jpg

No Validation Errors
    .. image:: ../images/design-studio/split-join/CollatorMappingDetailsValid.jpg


Connecting the Collator Output Port First
.........................................
* The output port of Collator should acquire the message signature of the input port of the Model, then collator’s source table should be auto populated with details viz., the name of the source, parameter name, parameter type, its tag number and an initially empty mapping field in the collator map, based on the information contained in the protobuf file of the source
* Collator should analyse the output port message signature and split it into its component parts (i.e., into parameters which have tag numbers associated to them).

Connecting the Input Port First
...............................
* In this case the input port of Collator remains as ANY
* Collator’s target table is auto populated with details the parameter name(s), parameter type(s)  parameter tag number(s), and the mapping field should be populated with the list of output tag numbers, based on the information contained in the protobuf file of the target.

Validation Rules
................
* The collator will allow a mapping between a pair of source and target parameters only if their message signatures match, otherwise an error should be indicated in the mapping area to allow the user to correct it.  (Alternatively show Pop Up when the mapping is invalid)
* A parameter on the source side cannot be mapped to more than one tag on the target side
* Two or more parameters from the source cannot be mapped to the same tag in the target message
* Multiple parameters from a single data source (i.e., Model) may map to different tags in the target message
* When no parameters from a source are mapped to the target message (figure – 4), them the Collator should show an error until that data source is deleted or one of the parameters is mapped
* Collator must make sure that at least one parameter from each source  have been mapped to their corresponding target side tags, otherwise an error should be shown in the mapping area, until this condition is satisfied (i.e., that link is removed and therefore the corresponding un necessary entries are removed)
* Collator must make sure that all target side parameters have been mapped, otherwise an error should be shown against those entries in the mapping
* When both the source and target side parameters have been mapped correctly, the error mark should be taken away
* The output port should have only one outgoing link
* The input port can have one or more links (a single link case is possible if this link provides more parameters than that required by collator’s output port).


Saving
======
Above the canvas, select the **Save** button and enter the details of the
solution. This will be saved in "My Solutions" area.

Deploying
=========
To generate a TOSCA blueprint for deployment to a cloud environment, select the
**Validate** button. If validation is successful, the deploy button will be
enabled. On click of any of the cloud platforms, you will be redirected to the
**Manage my Model- Deploy to Cloud** page. At this point, this model should be
usable with the Data Broker when deployed. See the
:doc:`../marketplace/marketplace-model-deploy` section for more information on
deploying models.

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

=================
Model Composition
=================

The main function of the Design Studio is to compose the ML Models to produce a meaningful application.

Criterion for Model Composition
===============================

Currently the Design Studio implements a simple model composition strategy based on matching the output message of the output port of one ML Model to the input message of the input port of another ML Model.

In the Design Studio a pair of ports are compatible if the requirement of one port can be matched with the capability of another port. Or if the output of one model can be consumed by the input port of another model so as to get some service from the latter.

The matching criterion is based on comparing the Protobuf message signature of the output port to the message signature of the input port of another model.

A pair of output and input messages are compatible if all the following conditions are satisfied:

#) The number of tags in both their message signatures is the same
#) For each tag number, the fields on both the sides are of the same type
#) For each tag number, the fields on both the sides have the same role – repeated, optional, etc. 

NOTE: the field names are not taken into consideration for determining compatibility.

A pair of output and input ports are compatible, if all the following conditions are satisfied:

#) They both produce and consume identical number of messages
#) Each message on one side is compatible with another message on another side, as per the compatibility definition given above

NOTE: the message names are not taken into consideration for determining the compatibility.
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

===================
Generic Data Mapper
===================
The Generic Data Mapper service enables a user to connect two ML models A and
B, where number of output fields of model 'A' and input fields of model 'B' are
same.  A user is able to connect the field of model A to the required field of
model B. The Generic Data Mapper performs data type transformations between
Protobuf data types. To use the Data Mapper successfully, a user should be well
aware of the output value of each field of model A and the expected input value
of each field of model B to get desired final output.

The Generic Data Mapper has the following functionality:

#. Maps data types between a pair of incompatible ports of the ML Models – map the data type of an output port to the data types of an input port
#. Any output port of a ML Model can be connected to a Data Mapper, and the Data Mapper can be connected to any input port of the ML Model
#. Composition Rule: From the Design Studio composition perspective a Data Mapper can accept any inputs and produce any outputs, depending on the ML models that are connected to its input and output side. So its requirements and capability will be indicated any
#. Performs transformation between basic Protobuf types only


A Generic Data Mapper can be found in Design Studio UI under the **"Data Transfrom Tools"** palette.

Connecting Incompatible Ports
-----------------------------
Coming soon.
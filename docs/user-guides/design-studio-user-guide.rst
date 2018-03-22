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

.. _design-studio-user-guide-top:

========================
Design Studio User Guide
========================


1. Introduction
======================

    This is a user’s guide that describes how to use the Design Studio tool.

**1.1    What is Design Studio?**

    The Design Studio is a web based tool to:

    1.    Create machine learning applications, hereafter referred to as composite solutions, out of the basic building blocks – the individual Machine Learning (ML) models contributed by the open source user community.

    2.    Validate the composite solutions.

    3.    Generate the blueprint of the composite solution for deployment on the target cloud. 

**1.2    Target Users**

    The Design Studio is targeted towards user community that has some basic understanding of:

    1.    The ML Models, the functions they perform

    2.    Components, interfaces, and operations supported by them

**1.3    Assumptions**

    It is assumed that the ML Models contributed by the open source community:

    1.    Provide the basic request response style of communication.

    2.    Can be converted in Microservices

    3.    Are capable of communicating via Http REST mechanism. 

    4.    Are developed in Java, Python 3.0, R and sourced from toolkits such as Scikit, TensorFlow, H2O, and RCloud.

2. Basic Building Blocks of Design Studio
==================================================

    ML Models are the basic building blocks in the Design Studio. It is these models that are combined together by the designer to create complex ML application – aka composite solutions. 

**2.1    ML Models – Isolated and Standalone**

    ML Models are developed and contributed by ML subject matter experts. They may be written in any programming language and may have been developed in any toolkit – Scikit, Tensor Flow, R, H2O, etc.

    The model developer may not necessarily be aware of the existence of other models. The models are usually standalone entities. They offer a standard contract – an interface definition to the external world. This contract specifies the details of the operation performed by the model, the input request (message) consumed by the model and the output response (message) produced by the model.

    In Acumos, this contract is specified in the Protobuf file.

**2.2    ML Models – Ports, Requirements and Capabilities**

    Each ML Model may support one or more operations – corresponding to the functions, such as “prediction”, “classification”, etc. performed by the model. Each operation consumes an input message and produces an output message. The message signatures are specified in the Protobuf file. 

    Each operation is represented by two ports – an input port and an output port. An ML model may have more than two ports, if it provides (exposes) multiple operations (aka services).

    1.    Input Port - consumes the input message and provides the service, such as prediction or classification or regression to the caller/client. The input port represents the capability of the model. The client that need a service to be performed need to send a request to input or the capability port of the model.

    2.    Output Port – produces the output (response) message. Note that the output produced by an operation (say the Prediction message) need not necessarily be consumed by the caller/client, but in fact needs to be fed to another ML Model which provides another service, such as classification (of the Prediction message). So from a composition perspective, the output port represents a requirement that is satisfied by classification service.


3. Model Ingestion in Design Studio
============================================

**3.1    How to ingesting ML Models in Design Studio**

    In order to ingest the ML Models, on boarded via the on boarding mechanism, into the Design Studio, the following steps must be performed.

    1.    The models must be on boarded via on boarding mechanism along with their Protobuf files or when the model were on boarded their Protobuf files should have auto generated.

    2.    The Protobuf files should have both the service specification and the message specifications.

    3.    The service specification of the Protobuf file should have the complete operation signature(s) listed in them – such as the 

        a.    Type of the operation – rpc, etc.

        b.    Name of the operation

        c.    Input message name

        d.    Output message name

    4.    Each input and output messages should have their message signatures listed, and each field type should be basic Protobuf data type. 

    5.    After the models have been successfully on boarded, the modeler must login to the Acumos Market Place Portal, in order to classify the uploaded model into one of model categories – currently four categories are supported in Design Studio – Classification, Prediction, Regression and Other. 

    6.    In order to classify the on boarded model into one of the four categories above, the modeler needs to:

        a.    Go to the “My Models” in Market Place.

        b.    Click on the newly on boarded model.

        c.    Click on “Manage My Models”.

        d.    Click on “Publish to Company Marketplace”

        e.    Click on “Model Category”

        f.    Select the appropriate model category and the toolkit type.

        g.    Click Done.

    7.    The model would now appear in the “Models” (left hand side) palette of the Design Studio under the appropriate category. The model is now available to be dragged and dropped in the Design Studio canvas.
    

**3.2    Files generated for Design Studio**

    Once the models have been on boarded, the Protobuf files associated with the model is used to generate Protbuf.json and TGIF.json files

3.2.1    Protobuf.json File

    This is an intermediary file used to represent the Protobuf.proto file in JSON format. It is used for the generation of TGIF.json file.

3.3.2    TGIF.json File

    The TGIF.json file represents an ML Model in the Design Studio. Every model should have a TGIF.json file associated with it to allow the model to be represented in the Design Studio, dragged and dropped in the Canvas and to allow the model to be composed with another model – based on composition rules (explained next).

    The TGIF.json file contains four critical pieces of information:

    1.    **Self** – section: This section describes the name and version of the ML model which is displayed on the Design Studio Web UI.

    2.    **Services.provides** – section: This section provides a list of services offered by the ML Model. At present only the name of the operation and JSON representation of its input messages is included here. The information provided in Services.provides and Services.calls section is used for determining the composability of a pair of output and input ports of the ML Models.

    3.    **Services.calls** – section: This section provides a list of output messages of the services offered by the ML Model. As explained earlier, these output messages are consumed by the services provided by other ML Model(s). The name of the operation (same as provided in Services.provides) and JSON representation of its output messages is included here. The information provided in Services.provides and Services.calls section is used for determining the composability of a pair of output and input ports of the ML Models.

    4.    **Artifacts. Uri** – section: This section contains the location of the docker image of the ML Model. This information is used by the Blueprint file to retrieve the docker image of the model in order to deploy it in cloud. 


4. Model Composition in Design Studio
================================================


    The main function of the Design Studio is to compose the ML Models to produce a meaningful application.

**4.1    Criterion for Model Composition**

    Currently the Design Studio implements a simple model composition strategy based on matching the output message of the output port of one ML Model to the input message of the input port of another ML Model. 

    In the Design Studio a pair of ports are compatible if the requirement of one port can be matched with the capability of another port. Or if the output of one model can be consumed by the input port of another model so as to get some service from the latter. 

    The matching criterion is based on comparing the Protobuf message signature of the output port to the message signature of the input port of another model. 

    A pair of output and input messages are compatible if all the following conditions are satisfied:

        1.    The number of tags in both their message signatures is the same.

        2.    For each tag number, the fields on both the sides are of the same type. 

        3.    For each tag number, the fields on both the sides have the same role – repeated, optional, etc.

    NOTE: the field names are not taken into consideration for determining the compatibility. 

    A pair of output and input ports are compatible, if all the following conditions are satisfied:

        1.    They both produce and consume identical number of messages.

        2.    Each message on one side is compatible with another message on another side, as per the compatibility definition given above.

    NOTE: the message names are not taken into consideration for determining the compatibility.

    
5. Design Studio User Interface – A Tour
==================================================

**5.1    UI Layout**

    The Design Studio UI, shown below consists of a Design Canvas with a grid background in the center flanked on left and right hand side by the Models & Solutions Catalog Palette and the Properties & Matching Model Palette. At the bottom of the Design Canvas is the Validation Console. At the top are the New, Clear, Validate, and Save buttons. 

 
    .. image:: images/design-studio/DesignStudioUserInterface.jpg
      :alt:    Figure – 1. Design Studio User Interface 

**5.2    Left Palette**

    5.2.1    Models – Tab

        Displays the catalog of the ML Models – the basic building blocks used for creating composite solutions. The models are currently classified under four categories – Classification, Prediction, Regression and Others. 

        5.2.2    Solutions – Tab 

        Displays the catalog of composite solutions (built out of basic building blocks) that have either “Public” visibility or belong to the logged in persons “Organization”. 

        5.2.3    Data Transformation Tools 

        A set of useful data transformation utilities are displayed here. Currently there is a Data Mapper which performs mapping between some basic Protobuf data types, such as int32, string, float, double and bool. 

        An Aggregator is another utility that is planned to be deployed there.

        5.2.4    Data Sources 

        This section is meant to represent data sources which feed the ML Models. It could be any entity that produces data that is consumed by ML Models and Data Transformation Tools, such Data Lakes, Databases, Cell Towers, Network elements which produce data such as Routers, Switches, etc. 

    5.3    Right Palette

        5.3.1    Properties Tab

        Displays the properties of elements – such as ML Models and Messages inside the Ports. 

        If an ML Model is selected by the user in the Design Canvas, it displays the name, type, owner, provider and tool kit type information. 

        If a Message inside the ML port is selected by the user, it displays the Protobuf message signature – such as the fields of the message, their name, type, tag and role (repeated, optional etc.)

        5.3.2    Matching Models Tab

        If a requirement (output) port of an ML Model is selected in the Design Canvas, then this tab shows a list of all models that have matching capabilities (in their input ports). The user can then drag the desired model in the Design Canvas and connect the output port to the input port.

        If a capability (input) port of an ML Model is selected in the Design Canvas, then this tab shows a list of all models that have matching requirements (in their output ports). 

        5.3.3    My Solutions

        Displays the catalog of composite solutions (built out of basic building blocks) that are marked “Private” to the logged in user.

        When the user clicks on an existing solution, that solution is displayed in the Design Canvas. The user can then make modification to the solution and save it as a separate solution by providing a new name or new version or both.

    5.4    Top Bar

        5.4.1    New

        The user clicks this button to create a new composite solution.

        5.4.2    Clear 

        The user clicks this button to clear an unsaved solution. 

        5.4.3    Save

        The user clicks this button to save a new composite solution or save changes to an existing solution. The user is prompted to provide the name, version and a description of the solution. The user can make modification to the solution and save it as a separate solution by providing a new name or new version or both. 

        5.4.4    Validate

        The user clicks this button to validate a composite solution created in the Design Canvas. Both the success and error messages are displayed in the Validation Console. If the solution is valid then a Blueprint.json file is created which is used to deploy the solution in the target cloud. 

    5.5    Center

        5.5.1    Design Canvas

            This is where the users drags one or more ML Models – the basic building blocks to create a composite solution or if the user clicks on an existing solution in Solutions or My Solutions tab, it is displayed in the Design Canvas. 

            5.5.1.1    Ports of the Model

            A model may have multiple ports. A Requirement (output) port is represented by a filled-in circle and a Capability (input) port is represented by an empty circle. The matching pair of ports are represented by identical icons inside their ports, such as diamonds, rectangles, triangles, + sign, etc. 

            5.5.1.2    Composition Based on Port Matching

            The Design Canvas is the place where the user performs model composition based on the port matching criterion discussed earlier. The Design Canvas ensure that only matching ports are connected via a link. It does not allow non matching ports to be connected, thereby facilitating the design – time validation of the composite solution. 

            5.5.1.3    How to name the ML Model

            A model name is automatically generated when a model is dragged from the “Models” catalog palette into the Design Canvas. The user can change the name by double clicking on the existing name and overwriting on it.

            5.5.1.4    How to name the Link

            Double click on the link – a text box appears, type the name of the link. 

            5.5.1.5    On Click of the Model

            The model properties such as its name, owner, company, toolkit (Scikit, TensorFlow, R, etc.) are displayed in the Property box.

            5.5.1.6    On Click of the Link

            The link properties such as its name appears in the Property box. 

            5.5.1.7    On Hover over a Port

            The name of the operation and name of either the input or the output message, depending on the port type, pops up in Design Canvas.

            5.5.1.8    On Click of the Port

            If the user clicks on an Output (Requirement) port, then all ML Models that have the matching input (Capability) ports are displayed in the Matching Models tab.

            If the user clicks on an Input (Capability) port, then all ML Models that have the matching Output (Requirement) ports are displayed in the Matching Models tab

            5.5.1.9    On Click of the message

            When the user does a mouse click on a port, then operation and message name(s) pop up. Now the user can click on the message and Protobuf message signature appears in the Property tab.

        5.5.2    Validation Console

            When the user requests the validation of the composite solution the Validation Console pops up from the bottom of the Design Canvas. This is where all the success and error messages related to the validation gets displayed. 

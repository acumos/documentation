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

==========================================
On-Boarding H2o.ai and Generic Java Models
==========================================

The Acumos Java Client Library command line utility is used to on-board H2o.ai and Generic Java models. This library creates artifacts from an H2o or Generic Java model and pushes the artifacts to the on-boarding server for the H2o Model runner to be able to use them.

High-Level Flow
===============

#) The Modeler creates a model in H2o and exports it in the MOJO model format (.zip file) using any interface (eg.Python, Flow, R) provided by H2o. For Generic Java, the Modeler creates a model and exports it in the .jar format.
#) The Modeler runs the JavaClient jar, which creates a Protobuf (default.proto) file for the Model, creates the required metadata.json file and an artifact called modelpackage.zip.
#) Depending on the choice of the Modeler, she can manually upload these generated artifacts to the Acumos Marketplace via its Web interface. This is Web-based on-boarding. We will see how to do this in this article.
#) Or the Java client library itself, on-boards the model onto the on-boarding server if the modeler provides the on-boarding server URL. This is CLI-based on-boarding.

The Model Runner provides a wrapper around the ML model, packages it as a containerized microservice and exposes a predict method as a REST endpoint. When the model is onboarded and deployed, this method (REST endpoint) can then be called by other external applications to request predictions off of the model.


Prerequisites
=============

- Java 1.8
- The latest `Java Client <https://nexus.acumos.org/#nexus-search;quick~java-client>`_ jar file
- The `H2o Generic Model Runner <https://nexus.acumos.org/#nexus-search;h2o-genericjava-modelrunner>`_


Preparing to On-Board your H2o or a Generic Java Model
======================================================
a. Place Java Client jar in one folder locally. This is the folder from which you intend to run the jar. After the jar runs, the created artifacts will also be available in this folder. You will use some of these artifacts if you are doing Web-based onboarding. We will see this later.

 |image0|

b. Prepare a supporting folder with the following contents. Items of this folder will be used as input for the java client jar. 

 |image1|

It will contain-
i) Models - In case of H2o, your model will be a MOJO zip file.  In case of Generic Java, the model will be a jar file.

ii) Protobuf compiler for java version 3.4.0 - Download protobuf-java-3.4.0.jar from http://central.maven.org/maven2/com/google/protobuf/protobuf-java/3.4.0/ and place it in this folder.

iii) Model runner or Service jar - For H2O rename h2o-genericjava-modelrunner.jar obtained from the 1st section to abcService.jar if your model name is abc. Place it in this folder. 

iv) csv file used for training the model - Place the csv file (with header having the same column names used for training but without the quotes (“ ”) ) you used for training the model here. This is used for autogenerating the .proto file. If you don’t have the .proto file, you will have to supply the .proto file yourself in the supporting folder. Make sure you name it default.proto.

v)  default.proto - This is only needed if you don’t have the csv file used to train the model. In this case, Java Client cannot autogenerate the .proto file. You will have to supply the .proto file yourself in the supporting folder. Make sure you name it default.proto Also make sure, the default.proto file for the model is in the following format. You need to appropriately replace the data and datatypes under DataFrameRow and Prediction according to your model.


.. code-block:: python

   syntax = "proto3";
   option java_package = "com.google.protobuf";
   option java_outer_classname = "DatasetProto";

   message DataFrameRow {
   string sepal_len = 1;
   string sepal_wid = 2;
   string petal_len = 3;
   string petal_wid = 4;
   }
   message DataFrame {
               repeated DataFrameRow rows = 1;
   }
   message Prediction {
               repeated string prediction= 1;
   }

   service Model {
   rpc transform (DataFrame) returns (Prediction);
   }

vi) application.properties file - Mention the port number on which the service exposed by the model will finally run on.


.. code-block:: python

   server.contextPath=/modelrunner       
   # IF WORKING WITH MODEL CONNECTOR AND COMPOSITE SOLUTION, THE #server.contextPath will be / 
   # NOTE: THIS WILL TAKE AWAY SWAGGER
   # This is the port number you want to run the service on. User may select a convenient port.
   server.port=8336

   spring.http.multipart.max-file-size=100MB
   spring.http.multipart.max-request-size=100MB

   # Linux version

   # if model_type is Generic Java, then default_model will be /models/model.jar
   # if model_type is H2o, then the default_model will be /models/Model.zip
   
   #default_model=/models/model.jar
   default_model=/models/Model.zip
  
   default_protofile=/models/default.proto

   logging.file = ./logs/modelrunner.log 

   # The value of model_type can be H or G
   # if model is Generic java model, then model_type is G.
   # if model is H2o model, then model_type is H. And the /predict method will use H2O model; otherwise, it will use generic Model
   # if model_type is not present, then the default is H
  
   #model_type=G
   model_type=H
   model_config=/models/modelConfig.properties

   # Linux some properties are specific to java generic models

   # The plugin_root path has to be outside of ModelRunner root or the code won't work 
   # Default proto java file, classes and jar
   # DatasetProto.java will be in $plugin_root\src
   # DatasetProto$*.classes will be in $plugin_root\classes
   # pbuff.jar will be in $plugin_root\classes

   plugin_root=/tmp/plugins



vii) modelConfig.properties - Add this file only in case of Generic Java model onboarding. This file contains the modelMethod and modelClassName of the model.

modelClassName=org.acumos.ml.XModel

modelMethod=predict


On-Boarding Your Model
======================

Java Client jar is the executable client jar file.

For Web-based onboarding of H2o models, the parameters to run the client jar are:
1.	Current Folder path : Folder path where you want the output modeldump.zip file.

2.	Model Type for H2o : H

3.	Supporting folder path : Full Folder path of the supporting folder which contains items

4.	Name of the model : For h2o just the name of the model without the .zip extension. Make sure this matches name of the supplied MOJO model file exactly.

5.	Input csv file : csv file that was used for training the model. Include the .csv extension in the csv file name. This will be used to autogenerate the default.proto file. This parameter will be empty if you yourself have supplied a default.proto for your model.


See example below for how to run the client jar and how the modeldump.zip artifact appears after its successful run:

 |image2|
 
 |image3|
 

For CLI-based onabording of H2o models, the parameters to run the client jar are: 

1. Onboarding server url
2. Pass the authentication url - This is the onboarding component which in turn calls Portal marketplace to get the jwtToken. This url can be obtained from the Onboarding Component team.
3. Model Type for H2o : H 
4. Supporting folder path : Full Folder path of the supporting folder which contains items 
5. Name of the model : For h2o just the name of the model without the .zip extension. Make sure this matches name of the supplied MOJO model file exactly.
6. Username of the Portal MarketPlace account
7. Password of the Portal MarketPlace account
8. Input csv file : csv file that was used for training the model. Include the .csv extension in the csv file name. This will be used to autogenerate the default.proto file. This parameter will be empty if you yourself have supplied a default.proto for your model.


For Web-based onboarding of Generic Java models, the parameters to run the client jar are: 

1. Current Folder path : Full folder path in which Java client jar is placed and run from. 
2. Model Type for Generic Java : G 
3. Supporting folder path : Full Folder path of the supporting folder which contains items 
4. Name of the model : For Generic Java just the name of the model without the .jar extension. Make sure this matches name of the supplied MOJO model file exactly.
5. Input csv file : csv file that was used for training the model. Include the .csv extension in the csv file name. This will be used to autogenerate the default.proto file. This parameter will be empty if you yourself have supplied a default.proto for your model.

For CLI-based onabording of Generic models, the parameters to run the client jar are: 

1. Onboarding server url
2. Pass the authentication url - This is the onboarding component which in turn calls Portal marketplace to get the jwtToken. This url can be obtained from the Onboarding Component team.
3. Model Type for Generic Java : G 
4. Supporting folder path : Full Folder path of the supporting folder which contains items 
5. Name of the model : For Generic Java just the name of the model without the .jar extension. Make sure this matches name of the supplied MOJO model file exactly.
6. Username of the Portal MarketPlace account
7. Password of the Portal MarketPlace account
8. Input csv file : csv file that was used for training the model. Include the .csv extension in the csv file name. This will be used to autogenerate the default.proto file. This parameter will be empty if you yourself have supplied a default.proto for your model.

 

Pushing to the Acumos Portal
============================

- You will be able to get a success message if your model was onboarded successfully. 
- If you use Web-based onboarding, 
a. After you run the client, you will see a modeldump.zip file generated in the same folder where we ran the Java Client for.
b. Upload this file in the Web based interface. 
c. You will be able to see a success method in the Web interface. you will be able to see a success method in the Web interface. 

 |image9|

- If you use CLI based onboarding,  you don't need to perform a-c outlined just above. The Java client will do it for you. You will see a message on the terminal that tells it was onboarded succesfully.
- The needed TOSCA artifacts, docker images are produced and the model is published to the marketplace.
- You and your teammates can now see, rate, review, comment, collaborate on your model in the Acumos marketplace.
- When requested and deployed by a user, your model runs as a docker containerised microservice on the infrastructure of your choice and exposes a predict method as a rest endpoint.
- This method can be called by other external applications to request predictions off of your model.



Addendum : Creating a model in H2o
==================================
You must have H2o 3.14.0.2 installed on your machine. For instructions on how to install visit the H2o `download page <https://www.h2o.ai/download/>`_.

H2o provides different interfaces to create models and use H2o for eg. Python, Flow GUI, R, etc.
As an example, below we show how to create a model using the Python innterface of H2o and also using the H2o Flow GUI. You can use the other interfaces too which have comparable functions to train a model and download the model in a MOJO format.

Here is a sample H2o iris example program that shows how a model can be created and downloaded as a MOJO using the Python Interface:

.. code-block:: python

   import h2o
   import pandas as pd
   import numpy as np
   import matplotlib.pyplot as plt
   import seaborn as sns

   # for jupyter notebook plotting,
   %matplotlib inline
   sns.set_context("notebook")

   h2o.init()

   # Load data from CSV
   iris = h2o.import_file('https://raw.githubusercontent.com/h2oai/h2o-3/master/h2o-r/h2o-package/inst/extdata/            iris_wheader.csv')

   Iris data set description
   -------------------------
   1. sepal length in cm
   2. sepal width in cm
   3. petal length in cm
   4. petal width in cm
   5. class:
       Iris Setosa
       Iris Versicolour
       Iris Virginica


   iris.head()
   iris.describe()
   # training parameters
   training_columns = ['sepal_len', 'sepal_wid', 'petal_len', 'petal_wid']
   #  response parameter
   response_column = 'class'

   # Split data into train and testing
   train, test = iris.split_frame(ratios=[0.8])
   train.describe()
   test.describe()

   from h2o.estimators import H2ORandomForestEstimator
   model = H2ORandomForestEstimator(ntrees=50, max_depth=20, nfolds=10)

   # Train model
   model.train(x=training_columns, y=response_column, training_frame=train)

   print (model)

   # Model performance
   performance = model.model_performance(test_data=test)
   print (performance)

   # Download the model in MOJO format. Also download the h2o-genmodel.jar file
   modelfile = model.download_mojo(path="/home/deven/Desktop/", get_genmodel_jar=True)

   predictions=model.predict(test)
   predictions

Here is a sample H2o iris example program that shows how a model can be created and downloaded as a MOJO using the H2o Flow GUI.
 
 |image4|

 |image5|

 |image6|

 |image7|

 |image8|

.. |image0| image:: ../images/java-client/downloaded_java_client.png
.. |image1| image:: ../images/java-client/supporting_folder.PNG
.. |image2| image:: ../images/java-client/running_the_java_client.PNG
.. |image3| image:: ../images/java-client/after_running_java_client.PNG
.. |image4| image:: ../images/java-client/1.png
.. |image5| image:: ../images/java-client/2.png
.. |image6| image:: ../images/java-client/3.png
.. |image7| image:: ../images/java-client/4.png
.. |image8| image:: ../images/java-client/5.png
.. |image9| image:: ../images/java-client/upload_modeldump.png
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

The Acumos Python Client library is required for users who want to push their TensorFlow and scikit-learn models to the Acumos Portal. You will use this library for on-boarding all your models. The library creates meta-data by introspection, packages all the necessary information, and then uploads it to Acumos On-Boarding server. The Acumos Python Client library is packaged and available on PyPI. Please see the `PyPI <https://pypi.org/project/acumos/>`_ page for instructions and a tutorial.

On-Board the model directly from an IDE
=======================================

We can on-board the model directly from an IDE such as Spyder. We will be using the same software as specified for the Model Onboarder:

- Web browser
- Python (3.4+)
- Acumos Client Library
- Protocol Buffers (Protobuf)
- an IDE (e.g. Anaconda Spyder)


The "AcumosSession" class of the Acumos Client Library allows us to specify the urls api of the Acumos platform to which the model will be pushed:

- push api url: http://<your_acumos_ip>:8090/onboarding-app/v2/models
- auth api url: http://<your_acumos_ip>:8085/api/auth/jwtToken

Once these apis are declared to the AcumosSession instance object, we can define our model and push it through the "AcumosSession.push()" method.


.. code-block:: python

   from acumos.modeling import Model, List, Dict, create_namedtuple, create_dataframe
   from acumos.session import AcumosSession, Requirements

   session = AcumosSession(push_api="http://<your_acumos_ip>:8090/onboarding-app/v2/models",
   auth_api="http://<your_acumos_ip>:8085/api/auth/jwtToken")
   import numpy as np
   import pandas as pd
   from sklearn.datasets import load_iris
   from sklearn.ensemble import RandomForestClassifier
   
   iris = load_iris()
   X = iris.data
   y = iris.target
   
   clf = RandomForestClassifier(random_state=0)
   clf.fit(X, y)
   
   # here, an appropriate NamedTuple type is inferred from a pandas DataFrame
   X_df = pd.DataFrame(X, columns=['sepal_length', 'sepal_width', 'petal_length', 'petal_width'])
   IrisDataFrame = create_dataframe('IrisDataFrame', X_df)
   # ==================================================================================
   # # or equivalently:
   #
   # IrisDataFrame = create_namedtuple('IrisDataFrame', [('sepal_length', List[float]),
   # ('sepal_width', List[float]),
   # ('petal_length', List[float]),
   # ('petal_width', List[float])])
   # ==================================================================================
   def classify_iris(df: IrisDataFrame) -> List[int]:
   '''Returns an array of iris classifications'''
   X = np.column_stack(df)
   return clf.predict(X)
   
   model = Model(classify=classify_iris)
   print("session dump")
   session.dump(model, 'my-model-image2', '~/') # creates ~/my-model-image
   print("session push")
   session.push(model, 'my-iris-model')



Execute the script and the console will prompt you to enter your Acumos username and password. Enter your login information, wait until the script finish its execution and congratulation ! your model is now on-boarded on the Acumos platform. Go to "My Models" to check it.


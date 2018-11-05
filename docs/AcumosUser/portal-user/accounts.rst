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

=======================================
Creating and Using an Account on Acumos
=======================================

Creating a User Account
=======================

In order to use the full capabilities of Acumos, users must create
an account on the Acumos Portal. The user may also complete a user profile.
Depending on the Acumos instance configuration, custom company login
options may be supported.

Account management capabilities are available in the upper right corner
of the user interface.

1. Click on Sign Up Now link on Acumos Home screen.

    .. image:: images/portal/signUpNow_link.png
       :width: 75%

2. Fill out information in the Sign Up window and click the **Sign Up** button on the bottom of the screen.

    .. image:: images/portal/signUp_screen.png

3. An account verification email will be sent to the email address that you entered. You cannot sign-in without verifying your email address. The verification link will be valid for a finite time period, as configured by the Acumos Platform Administrator.

4. Click on the link in the account verification email to activate your account. Clicking the link will take you to the Acumos verification page, where you should see the following:

    .. image:: images/portal/signUp_verification.png


5. After successfully verifying your email address, you can log into Acumos. See the :ref:`sign-in` section below.

6. If the account verification link has expired, you will get an error message. Click the **Refresh Token** button to generate a new account verification email.

    .. image:: images/portal/signUp_Verification_expired.png

.. note::
    Account creation may be customized on individual Acumos installations. If what you see on your local Acumos instance is different than what is in this guide, please consult your local Acumos Admin for assistance.

.. _sign-in:

Logging into Acumos
===================

The steps to login to Acumos are as follows:

1. Click on the **SIGN IN** link on the top right corner of the Home
   Page.

    .. image:: images/portal/signIn_screen.png


2. Fill in the username and password.

3. Click **Sign in** on the bottom of the screen.

.. note::
    Account log in may be customized on individual Acumos installations. If what you see on your local Acumos instance is different than what is in this guide, please consult your local Acumos Admin for assistance.

Resetting a Password
====================
The steps to reset a password are as follows:

1. From the **Sign in** window, click the **Forget Password** link

    .. image:: images/portal/password-forgetPasswordLink.png

2. Enter the email address associated with the account and then press the **Send** button

    .. image:: images/portal/password-resetScreen.png

.. note::
    Log in and password reset may be customized on individual Acumos installations. If what you see on your local Acumos instance is different than what is in this guide, please consult your local Acumos Admin for assistance.

Setting Profile and Notification Preferences
============================================

Your User Profile is designed to give your users a view of your work. When you
publish a model, either to your Company instance or to the Public, your
profile is always available by clicking on your name.

To update your user profile, click on your name in the upper right corner and
then choose **Account Settings**.

    .. image:: images/portal/userProfile_setupScreen.png

1) The API Token is used to onboard models from the command line
2) When you change your email address, you will be automatically logged out of the application and must log in again

From time to time, you may wish to be notified if a process, such has
requesting access to a model, has completed. To set up your notification
preferences, access the **Notification Preferences** tab.
@TODO - find out what the drop-down choices mean


    .. image:: images/portal/accountSettingNotificationPrefs.png

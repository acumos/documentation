.. ===============LICENSE_START=======================================================
.. Acumos CC-BY-4.0
.. ===================================================================================
.. Copyright (C) 2018 AT&T Intellectual Property & Tech Mahindra. All rights reserved.
.. ===================================================================================
.. This Acumos documentation file is distributed by AT&T and Tech Mahindra
.. under the Creative Commons Attribution 4.0 International License (the "License");
.. you may not use this file except in compliance with the License.
.. You may obtain a copy of the License at
..
.. http://creativecommons.org/licenses/by/4.0
..
.. This file is distributed on an "AS IS" BASIS,
.. See the License for the specific language governing permissions and
.. limitations under the License.
.. ===============LICENSE_END=========================================================

=======================================
Deploy Acumos Model to Azure User Guide
=======================================

Introduction
============

This guide is intended to help you:

* setup a Microsoft Azure account for use in deploying Acumos models
* access the deployed Azure VMs for testing etc

This guide assumes that you have an Azure account. If not, you can signup for a free trial account at https://azure.microsoft.com. 


Configuring Your Azure Account
==============================

This section will help you setup your Azure account for use in launching Acumos models, and save key account attributes for use in the Acumos portal "Deploy to Cloud" dialog. A summary of the minimum attributes you will need is below, followed by instructions on creating/obtaining these attributes.

* Application Id: "Application Id" value for your Azure Active Directory application
* Tenant Id: the "Directory ID" value under "Azure Active Directory" / "Properties"
* Secret key: application key "Value" created through "Settings" / "Keys" for your Azure Active Directory application
* Subscription Key: your "Subscription Id" 
* Resource Group: Name of your Resource group
* Acr Name: Name of your Azure Container Registry (ACR)
* Storage Account: Name of your Azure Storage Account

Copy Tenant Id
..............

The Acumos platform needs your Azure account "Azure Active Directory" ID during model launch in Azure. Note this ID is only provided by you in the "Launch in Azure" dialog, and is not retained by the Acumos platform. To copy this ID for later use, under "Azure Active Directory":

* select "Properties"
* copy the "Directory ID" value and save for later use as the "Tenant Id" in the "Launch in Azure" dialog

Copy Subscription Key
.....................

The Acumos platform needs your Azure account "Subscription Id" during model launch in Azure. Note your "Subscription Id" is only provided by you in the "Launch in Azure" dialog and is not retained by the Acumos platform. To copy this ID for later use, under "Cost Managemen + Billing":

* select "Subscriptions"
* select "My subscriptions"
* copy your "Subscription Id" and save for later use as the "Subscription Key" in the "Launch in Azure" dialog

Create an Azure Active Directory application entry for the Acumos portal
........................................................................

As described at https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal, the Acumos platform represents "code that needs to access or modify resources" in Azure, and to be given those permissions, needs to be registered as an Azure Active Directory (AD) application. The ID assigned to this application will be used by the Acumos platform during model launch in Azure. Note this ID is only provided by you in the "Launch in Azure" dialog and is not retained by the Acumos platform. To register the Acumos platform as an application and copy its ID for later use, under "Azure Active Directory":

* select "App registrations"
* select "+" (create new)
* enter a name
* enter any URL (this is not used for Acumos)
* set "Application type" to "Web app / API"
* select "Create"
* copy the displayed "Application Id" for later use as the "Application Id" in the "Launch in Azure" dialog

Create a Secret Key for the Azure Active Directory application
..............................................................

The Acumos platform needs to be assigned a secret key in order to access your Azure account during model launch in Azure. Note this secret key is only provided by you in the "Launch in Azure" dialog and is not retained by the Acumos platform.

To create and copy this secret key for later user, under "Azure Active Directory":

* select "App registrations"
* select the Azure Active Directory application registered above
* select "Settings"
* select "Keys"
* under "Passwords" enter a key name and duration
* select "Save"
* copy the displayed application key "Value" for later use as the "Secret Key" in the "Launch in Azure" dialog

Add Admin User permission for Your Azure Subscription
.....................................................

The Acumos platform needs to be able to create resources under your subscription, in order to deploy models there. To enable this, you need to assign the the Azure Active Directory application registered above with permissions as "Contributor" and "Reader", as below.

To create the needed permissions, under "Cost Management + Billing":

* select "Subscriptions"
* select "My subscriptions"
* select your subscription
* select "Access control (IAM)"
* select "+Add"
* set "Role" to "Contributor"
* set "Assign access to" to "Azure AD user, group, or application"
* under "Select" enter the Azure Active Directory application name you created above
* select the Azure Active Directory application name when it is displayed below
* select "Save"

Repeat this process, selecting this time the "Role" as "Reader".

Note that all resources you create below will now inherit these Admin user permissions, so you do not have to set permissions for each resource.

Create a Resource Group
.......................

Resource Groups allow management of resources with a common ("inherited") set of permissions and other options. The Acumos platform needs the name of a resource group under which you have created some basic resources (as described later) during model launch in Azure. Note this Resource Group name is only provided by you in the "Launch in Azure" dialog and is not retained by the Acumos platform.

If you don't have an existing resource group in the East US region, you will need to create one. To create a resource group, under "Resource groups":

* select "Create"
* enter a "Name" (you will use this name later in the "Launch in Azure" dialog)
* select "East US" (this location is currently required by the Acumos platform)
* select "Create"
* refresh the list of Resource groups and the new one should be displayed
* select the resource group

Create an Azure Container Registry (ACR)
........................................

An ACR is needed so the Acumos platform can push container images to your Azure account, for launch inside VMs created in the process of model deployment. Using an ACR under your Azure account can speed up model deployment. The Acumos platform needs the name of this ACR during model launch in Azure. Note this ACR name is only provided by you in the "Launch in Azure" dialog and is not retained by the Acumos platform.

If you don't have an existing ACR in the East US region, you will need to create one. To create a new ACR, under "All resources":

* select "+Add"
* select "Containers"
* select "Azure Container Registry"
* enter a "Name" (you will use this name later in the "Launch in Azure" dialog)
* set "Resource group" to "Use existing"
* from the drop-down list, select the resource group created above
* select "East US" (this location is currently required by the Acumos platform)
* select "Create"
 
Create a Storage Account
........................

A storage account is needed so the Acumos platform can install applications and save data to disk as needed during model deployment and execution. The Acumos platform needs the name of this storage account during model launch in Azure. Note the storage account name is only provided by you in the "Launch in Azure" dialog and is not retained by the Acumos platform.

If you don't have an existing storage account in the East US region, you will need to create one. To create a storage account, under "Storage accounts":

* select "+Add"
* enter a "Name" (you will use this name later in the in the "Launch in Azure" dialog)
* set "Resource group" to "Use existing"
* from the drop-down list, select the resource group created above
* select "East US" (this location is currently required by the Acumos platform)
* select "Create"

Create a Network Security Group and Access Rules
................................................

A network security group (NSG) is required so that the Acumos platform can configure access to necessary host ports on the deployed VMs. A specific NSG name is required by the Acumos platform. To create this NSG, under "Resource groups":

* select the resource group created above
* select "+Add"
* in the search box, enter "Security"
* in the resulting list, select "Network Security Group"
* select "Create"
* set "Name" to "E6E-NSG"
* set "Resource group" to "Use existing"
* from the drop-down list, select the resource group created above
* select "East US" (this location is currently required by the Acumos platform)
* select "Create"

To enable the Acumos platform to access VMs it deploys, deploy model microservices, and deploy additional components that help orchestrate and connect the models to your data sources, you will need to define NSG rules to open the following TCP ports to the Acumos platform. The Acumos platform will be identified here by IP address; you can get the IP address using a reverse-DNS lookup e.g. 'nslookup marketplace.acumos.org'. Ports that need to be opened, and their purpose, are described below:

* TCP port 22: SSH, enabling the Acumos platform to configure the deployed VM, e.g. install docker and the various microservices and platform components
* TCP port 8555: Acumos Blueprint Orchestrator, used in Composite Solution deployment
* TCP port 8556: Acumos DataBroker, a component deployed when a user wants assistance in mapping a data source to the protobuf interface of a deployed model (details will be provided for when this applies and how the user selects it)
* TCP port 5006: Acumos Probe, a component enabling the user to access and visualize the protobuf interfaces of their deployed solutions

If you need to provide access to your model microservices from outside the Azure virtual network, e.g. to push data to the microservice, you will need to create additional NSG rules to open the following ports to the IP addresses of systems to be connected to the microservices:

* TCP port 8557: microservice #1, i.e. for deployment of a single model microservice ("Simple Solution") or the first microservice in a multi-model deployment ("Composite Solution")
* TCP port 8558: microservice #2
* TCP port 8559: microservice #3
* TCP port 8560: microservice #4
* and so on

To add NSG rules, under "Resource groups":

* select the resource group created above
* select NSG "E6E-NSG"
* select "Inbound security rules"
* select "+Add"
* set "Source" to the IP address of the system that needs the access 
* select "Protocol" "TCP"
* set "Destination port ranges" to the specific port or range of ports that applies to the rule
* set "Name" to whatever helps you remember what the rule is related to
* select "Add"

Repeat this for any other hosts you want to have access to the VM, and for any other access rules that are needed for your deployed model or applications to be installed on or connected to the deployed VM.

Note: it is recommended to NOT set "Source" to "Any" and "Destination port ranges" to "*" as these settings can expose your VM to security risks.

Create a Virtual Network
........................

A virtual network and subnet is required so that required ports can be opened on the VM in which Acumos will launch your model. Acumos requires a specifically named virtual network and subnet, since it will create interfaces and public IP addresses on that network/subnet.

To create the specified virtual network, under "Resource groups":

* select the resource group created above
* select "+Add"
* enter "Networking" in the search bar and hit enter
* in the resulting list, select "Virtual network"
* select "Create"
* set "Name" to "Acumos-OAM-vnet"
* set "Resource group" to "Use existing"
* from the drop-down list, select the resource group created above
* select "East US" (this location is currently required by the Acumos platform)
* set "Subnet" to "Acumos-OAM-vsubnet"
* select "Create"

Associate the NSG to the Subnet
...............................

To ensure the NSG rules created above are applied to the subnet you created, under "Resource groups":

* select the resource group created above
* select the virtual network "Acumos-OAM-vnet"
* select "Subnets"
* select "Acumos-OAM-vnet"
* select "Network security group"
* select the NSG "E6E-NSG"
* select "Save"

Deploying Your Model
====================

Under "My models":

* select a model
* select "Deploy to Cloud"
* select "Microsoft Azure"

The resulting dialog will require the parameters listed under "Configuring Your Azure Account" in this guide.

You should see a notification "Deployment started successfully". You can see the history of such notifications using the Acumos portal, by selecting bell (notifications) icon in the upper right of the portal header.

The Acumos platform will create these resources under your Azure subscription:

* a NIC
* a public IP address
* a disk
* a VM

At the current time, there is no explicit notification that deployment was complete and successful. You can verify deployment success as described in the following section.

Accessing and Verifying the Deployment
======================================

The Acumos platform currently creates a single user account on the deployed VM, with these credentials:

* username: dockerUser
* password: 12NewPA$w0rd!

Cleaning up Azure Resources
===========================

The Acumos platform does not automatically remove resources that it creates under your Azure account. When you are done testing with the model in the launched VM, if you do not want to keep these resources active, you can delete them through the Azure "All resources" list.
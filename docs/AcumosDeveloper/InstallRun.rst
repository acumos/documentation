Installing and Running
======================

System Setup
------------
Prerequisites:

       Minimum required machines for running an instance of Acumos is 2 for docker-compose method.

- Application Server with Docker Engine.
- DB Server with Marida DB 10.2

+---------+-----------+-------+-----------+---------+-------+-------+-----------+-------+--------------------+
|CPU Cores|CPU Cores  |Memory |Memory     |Disk Size|   OS  |Version|  Public IP| Type  |     Description    |
|Minimum  |Recommended|Minimum|Recommended|         |       |       |           |       |                    |
+=========+===========+=======+===========+=========+=======+=======+===========+=======+====================+
|   8	  |     16    | 32 GB |	    64    | 100 GB  | Ubuntu| 16.04 |     Yes   |Core-VM| Application Server | 
+---------------------+-------+-----------+---------+-------+-------+-----------+-------+--------------------+
|   8	  |     16    | 32 GB |	    64    | 100 GB  | Ubuntu| 16.04 |     No    |DB-VM  | Database Server    | 
+---------------------+-------+-----------+---------+-------+-------+-----------+-------+--------------------+


Gerrit account setup
-----------------------

    go to `gerrit.acumos.org <http://gerrit.acumos.org>`_ and create an account
    
    request access to gerrit.acumos.org/acumos
 
db-vm setup
-----------


    **setup accounts**

         Login to the Database Server eg: db-vm which Ubuntu 16.04 pre-installed and become root
        
         Create a user (eg acumosopr)            

    **install mariadb**

        Download the install-mariadb-10.2.sh scripts on to the Database Server (eg: DB-vm)
        
    **configure acumos database**

        Following are the steps to install and setup acumos-application after the required servers (dbVM) are setup.
        
        
        
        sample:
        
        DATABASENAME = acumos_1_7_0
        
        USERNAME = acumos_opr
        
        
        
        create database
        
         mysql -u root -p

::

        drop database if exists DATABASENAME;
         create database DATABASENAME;
         create user 'USERNAME'@'localhost' identified by 'USERPASSWORD';
        grant all on DATABASENAME.* to 'USERNAME'@'localhost';
        create user 'USERNAME'@'%' identified by 'USERPASSWORD';
        grant all on DATABASENAME.* to 'USERNAME'@'%';
        flush privileges;
        quit

                or control-C out
                
                as the working user:
                
                create tables and data ( DDLs and DMLs)
                
                goto https://://gerrit.acumos.org/r/gitweb?p=common-dataservice.git; goto sources cmn-data-svr-server db-scripts 
                
                click on cmn-data-svc-ddl-dml-mysql-\*.sql where \* is DB version, click RAW control-A Control-C to copy
                
                create DDL.sql file and paste to it, add line to begining:
                
                use DATABASENAME;
                
                save DDL.sql
                
                run: mysql -u USERNAME -p < DDL.sql

nexus server setup
------------------

Nexus Repositories.

              Create Private Repositories to hold Models and Artifacts

               Example Nexus Repo Details

+--------------------+---------+-------------+------------------------+----------------------------+
|      Username      |   Type  |    Access   |        Description     |         Repository         |
+====================+=========+=============+========================+============================+
|companyA_model_ro   |  Docker |  Read Only  | ML Model Docker Images | companyA _repo_model_docker|
+--------------------+---------+-------------+------------------------+----------------------------+
|companyA_model_rw   |  Docker |  Read Write | ML Model Docker Images | companyA _repo_model_docker|
+--------------------+---------+-------------+------------------------+----------------------------+
|companyA _model_ro  |  Maven  |  Read Only  | ML TOSCA/Raw/code      | companyA _repo_model_maven |
+--------------------+---------+-------------+------------------------+----------------------------+
|companyA _model_rw  |  Maven  |  Read Write | ML TOSCA/Raw/code      | companyA _repo_model_maven |
+--------------------+---------+-------------+------------------------+----------------------------+

core-vm setup
-------------

    **setup accounts**

        Login to the Application server eg: core-vm with ubuntu 16.04 pre-installed and become root
        
        Create working user id (eg. acumosopr)

    **install docker**

        Download the install-docker-software.sh scripts on to the Application server (eg: core-vm)
        
         Execute the install-docker-software.sh script as root to install and configure Docker software - ". /tmp/install-docker-software.sh"
        
        **Note** If you are using insecure docker registries, update /etc/docker/daemon.json file accordingly

    **install java, and mavin (Do not need as Hippo CMS service is now dockerized)**
    
        add-apt-repository ppa:webupd8team/java
        
        apt-get update
        
        apt-get install oracle-java8-installer
        
        apt-get install maven
 
    **install acumos**   

    **configure acumos**

    **install hippo cms**

    **startup docker processes**

login to acumos
---------------

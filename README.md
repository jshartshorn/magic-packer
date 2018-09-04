General Notes
-------------

This project is used to create an ami from an iso image. the first steps is to create a standard virtual box from the iso image and save as an ovf file.

Process Description
-------------------

This process uses the HashiCorp tools vagrant and packer. This process also uses Virtual Box. The process takes a standard/custom .iso image and converts it to a standard virtual box image (ova) and then imports that ova to AWS using the AWS API importimage to create an AMI. The ova must confirm to the Amazon import requirements for AMI creation noted in https://docs.aws.amazon.com/vm-import/latest/userguide/vm-import-ug.pdf. This process was tested with a standard Ubuntu 64 1604.5 server image.


TODO
----

  - Test with the


Setup/Configure Tasks
-----

  1. Install Packer
  2. Install AWS CLI
  3. Install Virtual Box
  4. Install Vagrant
  5.


Running packer
-----------------

		packer 

Example(s):

		a

AWS ImportImage Policies and Permisssions:
------------------------------------------

https://docs.aws.amazon.com/vm-import/latest/userguide/vm-import-ug.pdf


AWS CLI
--------------

EX:

aws ec2 import-image --description "MagicAI Ubuntu OVA" --license-type BYOL --disk-containers file://containers.json

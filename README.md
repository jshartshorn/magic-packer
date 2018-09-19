General Notes
-------------

This project is used to create an ami from an iso image. the first steps is to create a standard virtual box from the iso image and save as an ovf file.

Process Description
-------------------

This process uses the HashiCorp tools vagrant and packer. This process also uses Virtual Box. The process takes an .iso machine image and converts it to a standard virtual box image (ova) and then imports that ova to AWS using the AWS API importimage service to create an AMI. The ova must confirm to the Amazon import requirements for AMI creation noted in https://docs.aws.amazon.com/vm-import/latest/userguide/vm-import-ug.pdf. This process was tested with a standard Ubuntu 64 1604.5 server image.

Setup/Configure Tasks
-----

  0. Install Packer
  0. Install AWS CLI
  0. Install Virtual Box
  0. Install Vagrant
  0. Ensure S3 bucket setup as guided in the vm-import user's guide
  0. Ensure your account has the appropriate policy and permissions as illustrated in the "AWS ImportImage Policies and Permissions" section below...  


Running packer
-----------------

Run packer from the shell as follows

Example(s):

Standard ubuntu machine

`packer build \
    -var 'aws_access_key=<your_aws_access_key>' \
    -var 'aws_secret_key=<your_aws_secret_key>' \
    -var 'vm_name=ubuntu_standard_64_amd' \
    -force \
    packer-ami-import.json`

or

MagicAI ISO

`packer build \
    -var 'aws_access_key=<your_aws_access_key>' \
    -var 'aws_secret_key=<your_aws_secret_key>' \
    -var 'vm_name=ubuntu-magic' \
    -force \
    magic-ami-import.json`


AWS ImportImage Policies and Permisssions:
------------------------------------------

https://docs.aws.amazon.com/vm-import/latest/userguide/vm-import-ug.pdf


AWS CLI
--------------

EX:

aws ec2 import-image --description "MagicAI Ubuntu OVA" --license-type BYOL --disk-containers file://containers.json

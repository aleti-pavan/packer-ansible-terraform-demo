# packer-ansible-terraform-demo
This repo is to do a demo together with packer, ansible and terraform with AWS.



## Overview

This project creates a AWS EC2 Instance that runs a local version of the website
[https://growlerfriday.com](https://growlerfriday.com) - which is pulled down
from [its GitHub repo](https://github.com/alkrauss48/growler-friday) and run using nginx.

Once created if you put IP address of ec2 into the browser, it should show the website resembles[https://growlerfriday.com](https://growlerfriday.com)


## Usage

Prior to running, make sure you have
1. awscli installed and configured (both `packer` and `terraform` uses this configuration)
2. packer and terraform installed.

configure `awscli` if it's not already configured. [configure awscli](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

```bash
git clone https://github.com/aleti-pavan/packer-ansible-terraform-demo.git
cd packer-ansible-terraform-demo

cd packer

packer build template.json

cd ../terraform

terraform init; terraform plan; terraform apply -auto-approve;



```

## Test

terraform execution returns 3 outputs like below, in your case IP address will be different to the below

```
Login-with-Key = ssh -i terraform-key ubuntu@3.84.111.178
curl = curl http://3.84.111.178
publicIp = 3.84.111.178

```

you can use `curl output` to test on the command line or `locate the ip into browser` to see the website resembles `growlerfriday.com`




## Destroy EC2 and Packer AMI

You will have to destroy created infrastructure in order to avoid any changes from AWS. Following steps would destroy the EC2 instance and also the AMI created by packer.

```bash

cd packer-ansible-terraform-demo/terraform

terraform destroy -auto-approve

aws ec2 deregister-image --image-id <image-id> (which is given by packer)

aws ec2 delete-snapshot --snapshot-id <snapshot-id> (take from aws console)


```

Login to AWS Console and verify the EC2 Dashboard on the right region to make sure all of the created infrastructure (EC2 & AMI) has been deleted.




This project is created with reference to `https://github.com/alkrauss48/ansible-packer-terraform-demo` , Many Thanks

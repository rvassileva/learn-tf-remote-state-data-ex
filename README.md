# Challenge: Remote State

Instruction

- Read this article Terraform Remote State Data Source (Documentation)
- Create github repo using the random_pet resource.

The repo consists of two terraform configurations - one that creates a VPC and a subnet with its state stored in S3 and one that creates an EC2 instance with random provider used for its name and its state stored locally. The terraform remote state data source is used to access only the subnet id from the remote state of the VPC config.

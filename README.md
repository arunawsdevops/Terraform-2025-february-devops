# Terraform Workspace

**Terraform Workspaces**: Workspaces in Terraform are used to isolate different environments with different state files. The bucket name will be unique for each workspace.

## Command to Create a Workspace:
```bash
terraform workspace new <workspace-name>
```


## commands to list the workspace
```bash
 terraform workspace list
 terraform workspace show
```

## command to switch to a workspace
```bash
 terraform workspace select <workspace-name>
```
 eg: terraform workspace new stage
 
```bash
terraform apply
```


## AWS S3 Bucket with Dynamic Naming in Terraform

This Terraform configuration creates an **AWS S3 bucket** with a **dynamically generated name** based on the **Terraform workspace**.  

## Resource: `aws_s3_bucket`

The following Terraform resource creates an S3 bucket with a name that dynamically changes depending on the Terraform workspace.

```hcl
resource "aws_s3_bucket" "test-bucket" {
  bucket = "terraform-workspace-test-demo-${terraform.workspace}"
}

```

## AWS Provider Configuration with Dynamic Profile in Terraform

This Terraform configuration dynamically assigns the AWS provider's `profile` based on the **current Terraform workspace**. This allows you to use different AWS profiles for different environments, such as `dev`, `staging`, and `prod`, without modifying the configuration.


## `provider.tf` Configuration

In the `provider.tf` file, the `profile` is dynamically set using the `${terraform.workspace}` variable. This ensures that the appropriate AWS profile is used based on the active Terraform workspace.

```hcl
provider "aws" {
  region  = "us-east-1"
  profile = "terraform-${terraform.workspace}"
}
```
## AWS CLI Configuration: Ensure that your AWS CLI has profiles configured for each workspace. You can configure multiple profiles using the AWS CLI by running:
```
aws configure --profile <profile-name>
```
eg: aws configure --profile terraform-dev

Each profile should have its respective credentials (AWS Access Key and Secret Key) 

resource "aws_s3_bucket" "test-bucket" {
  bucket = "terraform-workspace-test-demo-${terraform.workspace}"
}

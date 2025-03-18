module "bucket-module" {
    source = "./module-1"
  
}

module "ec2-module" {
    source = "./module-2"
  
}
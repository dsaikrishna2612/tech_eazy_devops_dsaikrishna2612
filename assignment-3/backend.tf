terraform {
  backend "s3" {
    bucket = "dsk-123465878fhdfgf"
    key    = "dev/terraform.tfstate"
    region = "eu-north-1"
    encrypt = true
  }
}

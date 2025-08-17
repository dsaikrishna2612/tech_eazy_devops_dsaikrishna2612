variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance type"
  type        = string
}

variable "key_name" {
  description = "Key Pair name"
  type        = string
}

variable "env_name" {
  description = "Environment name (dev/prod)"
  type        = string
}

variable "s3_bucket_name" {
  default = "dsk154984795"
}

variable "ssh_public_key" {
  type = string
}

variable "ssh_private_key" {
  type      = string
  sensitive = true
}

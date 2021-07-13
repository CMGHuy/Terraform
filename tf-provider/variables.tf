# List of variables that Terraform will use

# Provider

variable "tenancy_ocid" {}

variable "user_ocid" {}

variable "fingerprint" {}

variable "private_key_path" {}

variable "region" {}

variable "compartment_id" {}

# Different environments

variable "prefix" {}

variable "cheetah_env" {}

# Compute instance

variable "win12_image_id" {}

variable "subnet_lb1_id" {}

variable "template_folder" {}

variable "template_file" {}


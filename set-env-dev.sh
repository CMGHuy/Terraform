# List of environmental variables for Terraform script

# Provider
export TF_VAR_tenancy_ocid=ocid1.tenancy.oc1..example
export TF_VAR_user_ocid=ocid1.user.oc1..example
export TF_VAR_fingerprint=11:22:33:44:55:66:77:88:99:00:aa:bb:cc:dd:ee:ff
export TF_VAR_private_key_path=~/.oci/key-private.pem
export TF_VAR_region=eu-frankfurt-1

export TF_VAR_compartment_id=ocid1.compartment.oc1..example

# VCN (Virtual Cloud Network)
export TF_VAR_subnet_lb1_id=ocid1.subnet.oc1.eu-frankfurt-1.example

# Instance image: Windows-Server-2012-R2-Standard-Edition-VM-Gen2-2020.09.21-0
export TF_VAR_win12_image_id=ocid1.image.oc1.eu-frankfurt-1.example

# Environment used to create instances
export TF_VAR_prefix=COMPARTMENT_NAME
export TF_VAR_cheetah_env=APP_ENVIRONMENT
export TF_VAR_comp_storage_name=${TF_VAR_prefix}${TF_VAR_cheetah_env}Storage
export TF_VAR_comp_network_name=${TF_VAR_prefix}${TF_VAR_cheetah_env}Network

# Template for user data
export TF_VAR_template_folder=userdata
export TF_VAR_template_file=cloudinit.ps1
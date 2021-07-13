# Configuration file for worker instances

# Startup configuration utility for cloud compute instances
# Render a part using a `template_file`
data "template_file" "cloudinit_ps1" {
  template = "${file("${var.template_folder}/${var.template_file}")}"
}

# Render a multi-part cloud-init config making use of the part
# above, and other source files
data "template_cloudinit_config" "cloudinit_config" {
  gzip          = false
  base64_encode = true

  part {
    filename     = "cloudinit.ps1"
    content_type = "text/x-shellscript"
    content      = data.template_file.cloudinit_ps1.rendered
  }
}

# Config instance specifications
resource "oci_core_instance" "testMachine" {
  # Required
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = "VM.Standard2.1"
  count               = 9

  source_details {
    source_id               = var.win12_image_id
    source_type             = "image"
    boot_volume_size_in_gbs = "256"
  }

  # Optional
  display_name = "TESTMACHINE00"
  create_vnic_details {
    subnet_id               = var.subnet_lb1_id
    assign_public_ip        = false
    skip_source_dest_check  = true
  }

  # This flag is used to ensure the replacement of a resource is created before the original instance is destroyed
  lifecycle {
    create_before_destroy = false
  }

  metadata = {
    user_data = data.template_cloudinit_config.cloudinit_config.rendered
  }

  preserve_boot_volume = false
}
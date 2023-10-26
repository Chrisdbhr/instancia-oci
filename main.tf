terraform {
  backend "http" {
    address = "https://objectstorage.sa-saopaulo-1.oraclecloud.com/p/YR_2JVqed1HeZNCjGwY-RY1U0qk3jmG8pOmyQjUzqBWx16_V9bLac0Ucg6Nd7gzr/n/grnm4bjzvvdu/b/terraform/o/terraform.tfstate"
    update_method = "PUT"
  }
}

variable "tenancy_ocid" {
}

variable "user_ocid" {
}

variable "fingerprint" {
}

variable "region" {
}

variable "private_key" {
}

provider "oci" {
    tenancy_ocid     = var.tenancy_ocid
    user_ocid        = var.user_ocid
    fingerprint      = var.fingerprint
    private_key      = var.private_key
    region           = var.region
}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		is_live_migration_preferred = "true"
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "NXhS:SA-SAOPAULO-1-AD-1"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaauvulx2dk6ypl4wjafr67jz2vkbqi75g3se53icechv5e5a52s6sa"
	create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		subnet_id = "ocid1.subnet.oc1.sa-saopaulo-1.aaaaaaaaoqimg5c6leh4hgdvrv65fp7xi6bxnudte2t5coax5sqjbw4uqlqq"
	}
	display_name = "based"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	is_pv_encryption_in_transit_enabled = "true"
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5e04vGZEQ10tfDmC1a2pWnxlUBGzlNiP1FMSFKz6uGNGvO/SxFBU3fQtXEP5Cj1Fdj6/wMx9bGroVTFGt1d6CsTLGkNDaLS4HOIbbHpia9RMx1AVA77cRid1aoiOESqh8BiIZTYb9+gMjl8HRSVvp3DTdRcpz8qaZq4i6XLXAvKNFs1IXwHCVVKkjWQA0p37TvPiyQbZnSgSuf2VKQuFzUPhBM2SAIv01C4ScvkCDtfWoQNfP8IpiJgeLPA2BdGbvi1rKVO8PkPXgOE1rw0puIE0hg5YC3xAJBfHt6XD53WV2J2oDRu/lNezsfN7yClwCNGqaKu6UstTFbzV/GQDN ssh-key-2023-10-26"
	}
	shape = "VM.Standard.A1.Flex"
	shape_config {
		memory_in_gbs = "24"
		ocpus = "4"
	}
	source_details {
		source_id = "ocid1.image.oc1.sa-saopaulo-1.aaaaaaaakvw6ryd3n4rh4piiitvsmzuhxgyzs7urdexxuojifnunhjmiujbq"
		source_type = "image"
	}
}

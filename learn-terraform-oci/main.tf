terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
}

provider "oci" {
  region              = "eu-frankfurt-1"
  //no need to use token and profile when it's default
  //auth                = "SecurityToken"
  //config_file_profile = "DEFAULT"
}

resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = "ocid1.compartment.oc1..aaaaaaaanwem7xa7q7xubbc4heyap3qnkopittitpxk4a7xp3h4y62mqdlka"
  display_name   = "My internal VCN"
}

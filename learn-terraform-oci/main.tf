terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
}

provider "oci" {
  region              = var.region
  //no need to use token and profile when it's default
  //auth                = "SecurityToken"
  //config_file_profile = "DEFAULT"
  //add clingxin profile after running "oci session authenticate"
    auth                = "SecurityToken"
    config_file_profile = "clingxin"
}

resource "oci_core_vcn" "internal" {
  dns_label      = "internal"
  cidr_block     = "172.16.0.0/20"
  compartment_id = var.compartment_id
  display_name   = "My internal VCN"
}

resource "oci_core_subnet" "dev" {
  vcn_id                      = oci_core_vcn.internal.id
  cidr_block                  = "172.16.0.0/24"
  compartment_id              = var.compartment_id
  display_name                = "Dev subnet"
  prohibit_public_ip_on_vnic  = true
  dns_label                   = "dev"
}


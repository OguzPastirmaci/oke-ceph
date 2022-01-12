variable "tenancy_ocid" {
}

variable "compartment_ocid" {
}

variable "region" {
}
variable "cluster_kubernetes_version" {
  default = "v1.21.5"
}

variable "node_pool_kubernetes_version" {
  default = "v1.21.5"
}

# Settings for nodepool "common"
variable "node_pool_shape_common" {
  default = "VM.Optimized3.Flex"
}

variable "node_pool_shape_ocpus_common" {
  default = 4
}

variable "node_pool_shape_memory_in_gbs_common" {
  default = 32
}

variable "node_pool_size_common" {
  default = 3
}

# Settings for nodepool "cepth"
variable "node_pool_shape_ceph" {
  default = "VM.Standard.E4.Flex"
}

variable "node_pool_shape_ocpus_ceph" {
  default = 4
}

variable "node_pool_shape_memory_in_gbs_ceph" {
  default = 16
}

variable "node_pool_size_ceph" {
  default = 3
}

variable "ceph_block_volume_size" {
  default = 500
}

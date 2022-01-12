data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

data "oci_core_services" "all_services" {
  filter {
    name   = "name"
    values = [".*All.*"]
    regex  = true
  }
}

data "oci_containerengine_node_pool_option" "node_pool_options" {
  node_pool_option_id = "all"
  compartment_id      = var.compartment_ocid
}

data "oci_core_images" "compatible_images_common" {
  compartment_id = var.compartment_ocid
  shape          = var.node_pool_shape_common
  state          = "AVAILABLE"
  sort_by        = "TIMECREATED"
  sort_order     = "DESC"
}
locals {
  node_pool_images_common = [for x in data.oci_containerengine_node_pool_option.node_pool_options.sources : x if contains(data.oci_core_images.compatible_images_common.images[*].id, x.image_id)]
}

data "oci_core_images" "compatible_images_ceph" {
  compartment_id = var.compartment_ocid
  shape          = var.node_pool_shape_ceph
  state          = "AVAILABLE"
  sort_by        = "TIMECREATED"
  sort_order     = "DESC"
}
locals {
  node_pool_images_ceph = [for x in data.oci_containerengine_node_pool_option.node_pool_options.sources : x if contains(data.oci_core_images.compatible_images_common.images[*].id, x.image_id)]
}

data "oci_containerengine_node_pool" "common" {
  #Required
  node_pool_id = oci_containerengine_node_pool.common.id
}

data "oci_containerengine_node_pool" "ceph" {
  #Required
  node_pool_id = oci_containerengine_node_pool.ceph.id
}

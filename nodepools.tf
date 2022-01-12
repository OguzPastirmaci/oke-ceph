resource "oci_containerengine_node_pool" "common" {
  cluster_id     = oci_containerengine_cluster.generated_oci_containerengine_cluster.id
  compartment_id = var.compartment_ocid
  initial_node_labels {
    key   = "role"
    value = "application-node"
  }
  kubernetes_version = var.node_pool_kubernetes_version
  name               = "common"
  node_config_details {
    dynamic "placement_configs" {
      for_each = data.oci_identity_availability_domains.ads.availability_domains

      content {
        availability_domain = placement_configs.value.name
        subnet_id           = oci_core_subnet.node_subnet.id
      }
    }
    size = var.node_pool_size_common
  }
  node_shape = var.node_pool_shape_common
  node_shape_config {
    memory_in_gbs = var.node_pool_shape_memory_in_gbs_common
    ocpus         = var.node_pool_shape_ocpus_common
  }
  node_source_details {
    image_id    = local.node_pool_images_common.0.image_id
    source_type = "IMAGE"
  }
}

resource "oci_containerengine_node_pool" "ceph" {
  cluster_id     = oci_containerengine_cluster.generated_oci_containerengine_cluster.id
  compartment_id = var.compartment_ocid
  initial_node_labels {
    key   = "role"
    value = "storage-node"
  }
  kubernetes_version = var.node_pool_kubernetes_version
  name               = "ceph"
  node_config_details {
    dynamic "placement_configs" {
      for_each = data.oci_identity_availability_domains.ads.availability_domains

      content {
        availability_domain = placement_configs.value.name
        subnet_id           = oci_core_subnet.node_subnet.id
      }
    }
    size = var.node_pool_size_ceph
  }
  node_shape = var.node_pool_shape_ceph
  node_shape_config {
    memory_in_gbs = var.node_pool_shape_memory_in_gbs_ceph
    ocpus         = var.node_pool_shape_ocpus_ceph
  }
  node_source_details {
    image_id    = local.node_pool_images_ceph.0.image_id
    source_type = "IMAGE"
  }
}

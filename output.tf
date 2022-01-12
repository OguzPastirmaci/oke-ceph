output "cluster" {
  value = {
    id                 = oci_containerengine_cluster.generated_oci_containerengine_cluster.id
    kubernetes_version = oci_containerengine_cluster.generated_oci_containerengine_cluster.kubernetes_version
    name               = oci_containerengine_cluster.generated_oci_containerengine_cluster.name
  }
}

output "node_pool_common" {
  value = {
    id                 = oci_containerengine_node_pool.common.id
    kubernetes_version = oci_containerengine_node_pool.common.kubernetes_version
    name               = oci_containerengine_node_pool.common.name
  }
}


output "node_pool_ceph" {
  value = {
    id                 = oci_containerengine_node_pool.ceph.id
    kubernetes_version = oci_containerengine_node_pool.ceph.kubernetes_version
    name               = oci_containerengine_node_pool.ceph.name
  }
}

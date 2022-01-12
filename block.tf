resource "oci_core_volume" "ceph_block_volume_paravirtualized" {
  count               = var.node_pool_size_ceph
  availability_domain = data.oci_containerengine_node_pool.ceph.nodes[count.index].availability_domain
  compartment_id      = var.compartment_ocid
  display_name        = "CephBlockVolumeParavirtualized${count.index}"
  size_in_gbs         = var.ceph_block_volume_size
}

resource "oci_core_volume_attachment" "ceph_block_volume_attach_paravirtualized" {
  count           = var.node_pool_size_ceph
  attachment_type = "paravirtualized"
  instance_id     = data.oci_containerengine_node_pool.ceph.nodes[count.index].id
  volume_id       = oci_core_volume.ceph_block_volume_paravirtualized[count.index].id
}

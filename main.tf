resource "oci_containerengine_cluster" "generated_oci_containerengine_cluster" {
  compartment_id = var.compartment_ocid
  endpoint_config {
    is_public_ip_enabled = "true"
    subnet_id            = oci_core_subnet.kubernetes_api_endpoint_subnet.id
  }
  kubernetes_version = var.cluster_kubernetes_version
  name               = "smartworks-oke"
  options {
    admission_controller_options {
      is_pod_security_policy_enabled = "false"
    }
    service_lb_subnet_ids = ["${oci_core_subnet.service_lb_subnet.id}"]
  }
  vcn_id = oci_core_vcn.generated_oci_core_vcn.id
}


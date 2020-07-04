output "traefik_public_ip" {
  value = ibm_compute_vm_instance.node.ipv4_address
}
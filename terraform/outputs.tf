output "server_outputs" {
  value = [
    "ssh ui root@${module.preemptible_server.0.floating_ip}",
    "ssh db root@${module.preemptible_server.1.floating_ip}"
  ]
}

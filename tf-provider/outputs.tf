# Output all the worker instances' IP addresses

output "testMachine_ip" {
  value = oci_core_instance.testMachine.*.private_ip
}

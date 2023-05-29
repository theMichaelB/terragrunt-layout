
output "console_messages" {
  value = { for k, v in local.merged : k => v.message if var.override_to_file != null ? !var.override_to_file : !v.to_file }
  description = "Messages to be printed to the console"
}
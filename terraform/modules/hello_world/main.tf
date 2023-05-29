locals {
  map1 = {
    "Module" = {
      message = "Hello from inside the module"
      to_file = false
    }
    "Alice" = {
      message = "Hello Alice"
      to_file = true
    }
  }
  merged = merge(local.map1, var.user_messages)
}




resource "local_file" "hello_user" {
  for_each = { for k, v in local.merged : k => v if var.override_to_file != null ? var.override_to_file : v.to_file }

  filename = "${each.key}.txt"
  content  = each.value.message
}

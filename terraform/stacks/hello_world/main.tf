
locals {
  map1 = {
    "Stack" = {
      message = "Hello from inside the stack"
      to_file = false
    }
    "Alice" = {
      message = "Hello Alice (updated from stack)"
      to_file = true
    }
  }
  merged = merge(local.map1, var.user_messages)
}



module "hello_world" {
  source = "../../modules//hello_world"

  user_messages = local.merged

  override_to_file = var.override_to_file
}
terraform {
  required_version = ">= 1.0"

  required_providers {
    null = {
      source  = "hashicorp/null"
      version = ">= 3"
    }
  }
}

resource "null_resource" "example" {
}

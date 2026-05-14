terraform {
  
  required_providers {
    kind = {
      source  = "kindly/kind"
      version = "~> 0.5"
    }
  }

  required_version = "~> 1.15.0"
}

provider "kind" {}
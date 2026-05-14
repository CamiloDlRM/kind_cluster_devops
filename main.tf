locals {
  worker_count = 3
}

resource "kind_cluster" "kind-local-cluster" {
    name           = "test-cluster"
    wait_for_ready = true

  kind_config {
      kind        = "Cluster"
      api_version = "kind.x-k8s.io/v1alpha4"

      node {
          role = "control-plane"

          kubeadm_config_patches = [
              "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
          ]

      }

    dynamic "node" {
      for_each = range(local.worker_count)
      content {
        role = "worker"
      }
    }

  }
}
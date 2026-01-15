# Grafana Mimir

## Overview

Grafana Mimir is an open source, horizontally scalable, highly available, and multi-tenant TSDB (Time Series Database) for long-term storage for Prometheus. It allows you to store metrics for long periods, enabling historical analysis and global views of your metrics across multiple Prometheus instances.

In Big Bang, Mimir is often used to offload storage from local Prometheus instances, serving as a centralized backend that Prometheus "remote writes" to.

## Dependencies

This package depends on an **Object Storage** solution to function. Mimir requires an S3-compatible backend (like AWS S3, Google Cloud Storage, Azure Blob Storage, or MinIO) to store blocks of metric data and ruler configurations.

* **Object Storage:** You must have either an external S3 bucket provisioned or the Big Bang `minio` package enabled.
* **Prometheus:** While Mimir can run independently, it requires a metric source (typically Prometheus via `remote_write`) to be useful.
* **Grafana:** Used to visualize the data stored in Mimir.

## How it works

This chart deploys Grafana Mimir into the `mimir` namespace. To deploy Mimir, it must be enabled in the Big Bang `values.yaml`.

Mimir is configured to use Object Storage for its data persistence. By default in Big Bang development environments, this may default to an in-cluster MinIO instance. However, in production environments, it is standard to configure Mimir to point to an external cloud provider's object store (e.g., AWS S3).

## External Resources

* [Official Documentation (Grafana Labs)](https://www.google.com/search?q=https://grafana.com/docs/mimir/latest/)
* [Source Code (GitHub)](https://www.google.com/search?q=https://github.com/grafana/mimir)

## Granting Egress to Blocked Services

When Istio hardening is enabled through the settings `istio.enabled` and `istio.enabled.hardened`, sidecars are injected into the `mimir` namespace. These sidecars limit network traffic to 'REGISTRY_ONLY', effectively blocking access to external services.

> **Note:** Access to external services (specifically Object Storage APIs) will be blocked.

This restriction commonly affects Mimir's ability to read/write blocks to cloud provider object stores (like AWS S3). To resolve this, you'll need to identify the hosts blocked by Istio and add a `customServiceEntry` for each one to your Big Bang `values.yaml` file. Example provided:

```yaml
mimir:
# Mimir configurations
  values:
    istio:
      hardened:
        customServiceEntries:
          - name: "aws-s3-access"
            hosts:
              - "s3.us-east-1.amazonaws.com" # Replace with your specific endpoint
            location: MESH_EXTERNAL
            ports:
              - number: 443
                name: https
                protocol: TLS
            resolution: DNS


### Discovering Blocked Hosts

To find out which hosts are being blocked (e.g., your S3 endpoint), inspect the `istio-proxy` logs from one of the Mimir pods (usually the `ingester` or `store-gateway`) using the following commands:

```bash
export SOURCE_POD=$(kubectl -n mimir get pod -l app.kubernetes.io/name=mimir-ingester -o jsonpath={.items[0].metadata.name})
kubectl -n mimir logs "$SOURCE_POD" -c istio-proxy | grep -i "BlackHoleCluster"

```
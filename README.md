<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# mimir

![Version: 5.5.1-bb.10](https://img.shields.io/badge/Version-5.5.1--bb.10-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.14.2](https://img.shields.io/badge/AppVersion-2.14.2-informational?style=flat-square) ![Maintenance Track: unknown](https://img.shields.io/badge/Maintenance_Track-unknown-red?style=flat-square)

Grafana Mimir

## Upstream References

- <https://github.com/grafana/mimir/tree/main/operations/helm/charts/mimir-distributed>

## Upstream Release Notes

- [Find upstream helm chart changelog and release notes here](https://github.com/grafana/mimir/blob/main/operations/helm/charts/mimir-distributed/CHANGELOG.md)
- [Find upstream application changelog and release notes here](https://grafana.com/docs/mimir/latest/release-notes/)

## Learn More

- [Application Overview](docs/overview.md)
- [Other Documentation](docs/)

## Pre-Requisites

- Kubernetes Cluster deployed
- Kubernetes config installed in `~/.kube/config`
- Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

- Clone down the repository
- cd into directory

```bash
helm install mimir chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| mimir-distributed | object | Our overrides are defined in charts/values.yaml file. | See https://github.com/grafana/mimir/blob/main/operations/helm/charts/mimir-distributed/values.yaml for available values. |
| minio-tenant | object | `{"address":"minio.mimir.svc.cluster.local","enabled":false,"tenant":{"buckets":[{"name":"mimir"}],"configSecret":{"accessKey":"minio","name":"mimir-objstore-creds","secretKey":"minio123"},"defaultUserCredentials":{"password":"supersecret","username":"mimir-user"},"metrics":{"enabled":false,"memory":"128M","port":9000},"pools":[{"containerSecurityContext":{"capabilities":{"drop":["ALL"]}},"labels":{"app":"minio","app.kubernetes.io/name":"minio"},"name":"pool-0","securityContext":{"fsGroup":1001,"runAsGroup":1001,"runAsUser":1001},"servers":1,"size":"750Mi","volumesPerServer":4}],"users":[{"name":"mimir-user-credentials"}]},"waitJob":{"enabled":false}}` | Configuration for the Big Bang MinIO tenant subchart. See repo https://repo1.dso.mil/big-bang/product/packages/minio for configuring values.yaml |
| minio-tenant.enabled | bool | `false` | Enable MinIO instance support, must have minio-operator installed |
| minio-tenant.tenant.configSecret | object | `{"accessKey":"minio","name":"mimir-objstore-creds","secretKey":"minio123"}` | MinIO root credentials |
| minio-tenant.tenant.buckets | list | `[{"name":"mimir"}]` | Buckets to be provisioned to for tenant |
| minio-tenant.tenant.users | list | `[{"name":"mimir-user-credentials"}]` | Name of the Secret that will contain the defaultUserCredentials generated for Tenant User |
| minio-tenant.tenant.defaultUserCredentials | object | `{"password":"supersecret","username":"mimir-user"}` | User credentials to create as a secret for above user. Otherwise password is randomly generated. This auth is not required to be set or reclaimed for minio use with mimir |
| networkPolicies.enabled | bool | `true` | Toggle networkPolicies |
| networkPolicies.controlPlaneCidr | string | `"0.0.0.0/0"` | Control Plane CIDR, defaults to 0.0.0.0/0, use `kubectl get endpoints -n default kubernetes` to get the CIDR range needed for your cluster Must be an IP CIDR range (x.x.x.x/x - ideally with /32 for the specific IP of a single endpoint, broader range for multiple masters/endpoints) Used by package NetworkPolicies to allow Kube API access |
| networkPolicies.additionalPolicies | list | `[]` |  |
| networkPolicies.egress | object | `{}` |  |
| istio.enabled | bool | `false` | Toggle istio configuration |
| istio.hardened | object | `{"alloy":{"enabled":true,"namespaces":["monitoring"],"principals":["cluster.local/ns/monitoring/sa/monitoring-alloy"]},"customAuthorizationPolicies":[],"customServiceEntries":[],"enabled":false,"grafana":{"enabled":true,"namespaces":["monitoring"],"principals":["cluster.local/ns/monitoring/sa/monitoring-grafana"]},"minio":{"enabled":true},"minioOperator":{"enabled":true,"namespaces":["minio-operator"],"principals":["cluster.local/ns/minio-operator/sa/minio-operator"]},"outboundTrafficPolicyMode":"REGISTRY_ONLY","prometheus":{"enabled":true,"namespaces":["monitoring"],"principals":["cluster.local/ns/monitoring/sa/monitoring-monitoring-kube-prometheus"]}}` | Default peer authentication values |
| istio.mtls.mode | string | `"STRICT"` | STRICT = Allow only mutual TLS traffic, PERMISSIVE = Allow both plain text and mutual TLS traffic |
| upgradeJob.enabled | bool | `true` |  |
| upgradeJob.name | string | `"mimir-upgrade-job"` |  |
| upgradeJob.image.repository | string | `"registry1.dso.mil/ironbank/big-bang/base"` | image repository for upgradeJob |
| upgradeJob.image.tag | string | `"2.1.0"` | image tag for upgradeJob |
| upgradeJob.image.imagePullPolicy | string | `"IfNotPresent"` |  |
| upgradeJob.image.pullSecrets | string | `"private-registry"` |  |
| upgradeJob.serviceAccount | string | `"upgrade-job-svc-account"` |  |
| upgradeJob.role | string | `"upgrade-role"` |  |
| upgradeJob.roleBinding | string | `"upgrade-rolebinding"` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.cypress.enabled | bool | `true` |  |
| bbtests.cypress.artifacts | bool | `true` |  |
| bbtests.cypress.envs.cypress_grafana_url | string | `"http://monitoring-grafana.monitoring.svc.cluster.local"` |  |
| bbtests.cypress.scripts.image | string | `"registry1.dso.mil/ironbank/big-bang/base:2.1.0"` |  |
| bbtests.cypress.scripts.envs.MIMIR_URL | string | `"http://mimir-mimir-distributor.mimir.svc:8080"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._


# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
## [5.8.0-bb.5]
### Added
- Added VirtualService support via bb-common routes pattern for external Grafana access to Mimir (Issue #91)

## [5.8.0-bb.4] (2025-12-11)
### Changed
- Updated the MinIO dependency chart from 7.1.1-bb.8 -> 7.1.1-bb.15
- Updated the gluon dependency chart from 0.9.5 -> 0.9.7
- Updated enterprise-metrics from 2.17.0 -> 2.17.3
- Updated nginx from 1.29.3 -> 1.29.4

    ## [5.8.0-bb.3] (2025-10-24)
### Changed
- Convert NetworkPolicies to bb-common format.
- Updated gluon to 0.9.5

## [5.8.0-bb.2] (2025-10-17)
### Changed
- Modified NetworkPolicy and AuthorizationPolicy to allow alloy-metrics connectivity to Mimir
- Increased default Alloy limits

## [5.8.0-bb.1] (2025-09-16)
### Changed
- Added upstream alias to mimir-distributed chart dependency to conform with Big Bang passthrough standards.

## [5.8.0-bb.0] (2025-09-09)
### Changed
- mimir-distributed updated from 5.7.0 to 5.8.0
- gluon 0.8.0 -> 0.9.0
- mimir-distributed 5.7.0 -> 5.8.0
- registry1.dso.mil/ironbank/opensource/grafana/mimir 2.17.0 -> 2.17.1
- registry1.dso.mil/ironbank/opensource/grafana/rollout-operator v0.28.0 -> v0.29.0

## [5.7.0-bb.5] (2025-09-03)
### Changed
- Added allow-egress-storage networkpolicy template to enable Mimir components to access S3 storage

## [5.7.0-bb.4] (2025-07-10)
### Changed
- gluon updated from 0.6.2 to 0.8.0
- minio updated from 7.0.0-bb.4 to 7.1.1-bb.8
- registry1.dso.mil/ironbank/opensource/grafana/rollout-operator updated from v0.27.0 to v0.28.0
- registry1.dso.mil/ironbank/opensource/nginx/nginx updated from 1.28.0 to 1.29.1
- registry1.dso.mil/ironbank/opensource/memcached/memcached updated from v1.6.38 to v1.6.39
- registry1.dso.mil/ironbank/opensource/grafana/mimir updated from 2.16.0 to 2.17.0
- registry1.dso.mil/ironbank/opensource/grafana/enterprise-metrics updated from 2.16.0 to 2.17.0

## [5.7.0-bb.3] (2025-07-08)
### Changed
- Updated Alloy network policy pod selector

## [5.7.0-bb.2] (2025-06-06)
### Changed
- gluon updated from 0.5.15 to 0.6.2
- registry1.dso.mil/ironbank/opensource/grafana/rollout-operator updated from v0.26.0 to v0.27.0
- registry1.dso.mil/ironbank/opensource/nginx/nginx updated from 1.27.5 to 1.28.0

## [5.7.0-bb.1] (2025-04-29)
### Added
- Added enterprise-metrics ironbank image to .Values.enterprise.image

## [5.7.0-bb.0] (2025-04-23)
### Changed
- mimir-distributed updated from 5.6.0 to 5.7.0
- registry1.dso.mil/ironbank/opensource/grafana/mimir 2.15.1 -> 2.16.0
- registry1.dso.mil/ironbank/opensource/grafana/rollout-operator v0.24.0 -> v0.26.0
- registry1.dso.mil/ironbank/opensource/nginx/nginx 1.27.4 -> 1.27.5

## [5.6.0-bb.1] (2025-04-07)
### Added
- Added Istio operatorless NetworkPolicy support

## [5.6.0-bb.0] (2025-04-01)
### Added
- Add ingestion_rate limit to default values

### Changed
- mimir-distributed updated from 5.5.1 to 5.6.0
- gluon 0.5.14 -> 0.5.15
- mimir-distributed 5.5.1 -> 5.6.0
- minio-instance 6.0.4 -> 7.0.0
- registry1.dso.mil/ironbank/opensource/grafana/mimir 2.14.2 -> 2.15.1

## [5.5.1-bb.11] (2025-03-26)
### Changed
- gluon 0.5.12 -> 0.5.14
- registry1.dso.mil/ironbank/opensource/grafana/rollout-operator v0.22.0 -> v0.24.0
- registry1.dso.mil/ironbank/opensource/memcached/memcached 1.6.34 -> 1.6.38
- registry1.dso.mil/ironbank/opensource/nginx/nginx 1.27.3 -> 1.27.4

## [5.5.1-bb.10] 2025-03-24
### Changed

- Enable exemplar storage

## [5.5.1-bb.9] 2025-03-20
### Changed

- Add default config to disable usage reporting to Grafana Labs

## [5.5.1-bb.8] 2025-03-19
### Added

- Added minio label to existing netpol to allow istio-proxy scraping

## [5.5.1-bb.7] 2025-03-11
### Added

- Added network policy to allow prometheus scraping on port 15020 for the istio-proxy podMonitors


## [5.5.1-bb.6] - 2025-02-20
### Changed

- Added pre-upgrade job to remove MinIO Tenant Pool prior to upgrade
- Set `.Values.nginx.enabled` to `false` as this is deprecated in favor of `gateway`

## [5.5.1-bb.5] - 2025-02-14
### Changed

- MinIO Tenant Pool from 4 to 1 server

## [5.5.1-bb.4] - 2025-01-31
### Added

- Added `app: minio` and `app.kubernetes.io/name: minio` labels to MinIO Tenant

## [5.5.1-bb.3] 2025-01-14
### Added

- Added Cypress Testing

## [5.5.1-bb.2] - 2025-01-08
### Changed

- mimir updated from 2.14.0 to 2.14.2
- rollout-operator updated from v0.20.0 to v0.22.0
- memcached updated from 1.6.31 to 1.6.34

## [5.5.1-bb.1] 2025-01-02
### Added

- Added Big Bang MinIO dependency for deployment with Mimir
- Added supporting Network Policies for MinIO
- Added Authorization Policies for MinIO
- Moved the values from test-values.yaml to values.yaml

## [5.5.1-bb.0] - 2024-12-31
### Changed

- mimir-distributed updated from 5.5.0 to 5.5.1
- gluon updated from 0.5.4 to 0.5.12

## [5.5.0-bb.8] - 2024-12-11
### Added

- Added Istio monitoring auth policy, auth policy template, sidecar, and service entry

## [5.5.0-bb.7] - 2024-12-11
### Added

- Network Policy for Grafana ingress
- Changed the index pattern for network policies

## [5.5.0-bb.6] - 2024-12-11
### Added

- Added higher Mimir ingester limits to values.yaml
- Added grpc and http ports to values.yaml instead of importing from upstream

## [5.5.0-bb.5] - 2024-12-04
### Changed

- Appended release name to Default-deny-all network policies

## [5.5.0-bb.4] - 2024-11-13
### Added

- Added more robust netpols

## [5.5.0-bb.3] - 2024-11-13
### Added

- Added istio peerauthentication policy
- Added minimum required netpols to deploy Mimir with istio

## [5.5.0-bb.2] - 2024-11-05
### Changed

- Modified chart.yaml details to accurately match upstream 5.5.0 tag
- Updated mimir image to use Ironbank equivalent
- Updated nginx image to use Ironbank equivalent
- Updated memcached image to use Ironbank equivalent

### Removed

- Removed additional unused values from values.yaml

## [5.5.0-bb.1] - 2024-10-31
### Changed

- Disabled MinIO and Grafana-Agent Operator
- Cleaned up values.yaml
- Add in default filesystem config

## [5.5.0-bb.0]
### Changetype (<https://keepachangelog.com/en/1.0.0/#how>)

- Initialized repo

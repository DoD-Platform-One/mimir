# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
## [5.5.1-bb.2] - 2025-01-08
### Changed

- mimir updated from 2.14.0 to 2.14.2
- rollout-operator updated from v0.20.0 to v0.22.0
- memcached updated from 1.6.31 to 1.6.34

## [5.5.1-bb.1] - 2025-01-02
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

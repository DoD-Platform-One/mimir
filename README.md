<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# mimir

![Version: 5.5.0-bb.1](https://img.shields.io/badge/Version-5.5.0--bb.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.8.3](https://img.shields.io/badge/AppVersion-2.8.3-informational?style=flat-square)

Grafana Mimir

## Upstream References

* <https://github.com/grafana/mimir/tree/main/operations/helm/charts/mimir-distributed>

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
| mimir-distributed | object | Our overrides are defined in charts/values.yaml file. | See https://github.com/grafana/mimir/blob/main/operations/helm/charts/mimir-distributed/values.yamlfor available values. |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._


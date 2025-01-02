# POC Deployment Framework for Mimir Sandbox

## Upstream Big Bang Repo

Upstream Big Bang branch for Grafana Alloy is [epic-414/mimir-sandbox](https://repo1.dso.mil/big-bang/bigbang/-/tree/epic-414/mimir-sandbox?ref_type=heads). 

**IMPORTANT:** The `epic-414/mimir-sandbox` should be treated as the Development branch where no direct commits are made against the branch other than MRs. No direct commit should be taken on the `epic-414/mimir-sandbox`. The process for MR to the branch should:

1. Create a branch.
2. Make changes to the new branch.
3. Create a MR with the Observability team as the Reviewers.
4. Approve and merge branch.

## Test Deployment of Mimir in Local K3d
The `helm upgrade` step should be deployed from the `epic-414/mimir-sandbox` branch in the Big Bang repo and include the below as overrides:

## Test values.yaml
<b>Note:</b > Please update the test values.yaml to include testing updated changes as issues get closed that enables those packages.

```yaml
domain: dev.bigbang.mil

flux:
  interval: 1m
  rollback:
    cleanupOnFail: false

istio:
  enabled: true
  values:
    hardened:
      enabled: true

addons:
  mimir:
    # git:
    #   tag: null
    #   branch: "<test-branch>"
    enabled: true
    # values:
    #   istio: # Waiting on istio issues completion before enabling
    #     enabled: true
    #     hardened:
    #       enabled: true


kyverno:
  enabled: true

kyvernoPolicies:
  enabled: true
  # restrict-image-registries enforcement is in Audit mode / Remove the below after ironbank images are uploaded
  values:
    policies:
      restrict-image-registries:
        validationFailureAction: Audit
```
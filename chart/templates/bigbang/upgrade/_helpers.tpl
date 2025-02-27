{{- define "mimir.shouldDeployUpgradeResources" -}}
{{/* Define upgradeVersion inside the template so it's available when the template is used */}}
{{- $upgradeVersion := "5.5.1-bb.5" -}}
{{- if and .Release.IsUpgrade (index .Values "minio-tenant" "enabled") .Values.upgradeJob.enabled -}}
  {{- $helmRelease := lookup "helm.toolkit.fluxcd.io/v2" "HelmRelease" "bigbang" "mimir" -}}
  {{- if $helmRelease -}}
    {{- $currentVersion := index $helmRelease.status.history 0 "chartVersion" -}}
    {{- if semverCompare (print "<" $upgradeVersion) $currentVersion -}}
true
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- end -}}
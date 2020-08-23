

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "httpbin.fullname" -}}
httpbin
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "httpbin.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "httpbin.labels" -}}
app: httpbin
{{- end }}

{{/*
Selector labels
*/}}
{{- define "httpbin.selectorLabels" -}}
app: {{ include "httpbin.fullname" . }}
{{- end }}


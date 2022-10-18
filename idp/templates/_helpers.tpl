{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "idp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "idp.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "idp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "idp.labels" -}}
helm.sh/chart: {{ include "idp.chart" . }}
{{ include "idp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "idp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "idp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


{{/*
Name of the configMap storing the IDP configuration
Returns:
  - the name of the secret-based config passed as .Values.cfgmapName
  - "<release_fullname>-config-secret" by default.
If the Secret config does not exist, the pod will hang due to missing mount.
*/}}
{{- define "idp.cfgmapName" -}}
{{- if .Values.cfgmapName }}
{{- printf "%s" .Values.cfgmapName }}
{{- else }}
{{- printf "%s%s" (include "idp.fullname" .) "-config-secret" }}
{{- end }}
{{- end }}


{{/*
Returns the WOPI Server external URL
*/}}
{{- define "idp.url" -}}
  {{- if .Values.idp.issuerURI -}}
    {{- .Values.idp.issuerURI }}
  {{- else }}
    {{- if .Values.ingress.hostname -}}
      {{- if .Values.ingress.tls -}}
        https://{{ .Values.ingress.hostname }}
      {{- else -}}
        http://{{ .Values.ingress.hostname }}
      {{- end -}}
    {{- else -}}
        http://{{ template "idp.fullname" . }}:{{ .Values.service.port }}
    {{- end -}}
  {{- end -}}
{{- end -}}

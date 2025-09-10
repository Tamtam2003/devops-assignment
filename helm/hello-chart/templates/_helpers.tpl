{{/*
Expand the name of the chart.
*/}}
{{- define "notepad-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a fullname by combining release name and chart name.
*/}}
{{- define "notepad-app.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "notepad-app.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Labels for resources.
*/}}
{{- define "notepad-app.labels" -}}
app.kubernetes.io/name: {{ include "notepad-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

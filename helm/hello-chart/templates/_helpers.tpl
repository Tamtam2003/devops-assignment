{{- define "hello-chart.name" -}}
{{ .Chart.Name }}
{{- end }}

{{- define "hello-chart.fullname" -}}
{{ printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "hello-chart.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}

# {{/* vim: set filetype=mustache: */}}
# {{/*
# Expand the name of the chart.
# */}}
# {{- define "alpha.name" -}}
# {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
# {{- end }}

# {{/*
# Create a default fully qualified app name.
# We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
# If release name contains chart name it will be used as a full name.
# */}}
# {{- define "alpha.fullname" -}}
# {{- if .Values.fullnameOverride }}
# {{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
# {{- else }}
# {{- $name := default .Chart.Name .Values.nameOverride }}
# {{- if contains $name .Release.Name }}
# {{- .Release.Name | trunc 63 | trimSuffix "-" }}
# {{- else }}
# {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
# {{- end }}
# {{- end }}
# {{- end }}

# {{/*
# Create chart name and version as used by the chart label.
# */}}
# {{- define "alpha.chart" -}}
# {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
# {{- end }}

# {{/*
# Common labels
# */}}
# {{- define "alpha.labels" -}}
# helm.sh/chart: {{ include "alpha.chart" . }}
# {{ include "alpha.selectorLabels" . }}
# {{- if .Chart.AppVersion }}
# app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
# {{- end }}
# app.kubernetes.io/managed-by: {{ .Release.Service }}
# {{- end }}

# {{/*
# Selector labels
# */}}
# {{- define "alpha.selectorLabels" -}}
# app.kubernetes.io/name: {{ include "alpha.name" . }}
# app.kubernetes.io/instance: {{ .Release.Name }}
# {{- end }}

# {{/*
# Create the name of the service account to use
# */}}
# {{- define "alpha.serviceAccountName" -}}
# {{- if .Values.serviceAccount.create }}
# {{- default (include "alpha.fullname" .) .Values.serviceAccount.name }}
# {{- else }}
# {{- default "default" .Values.serviceAccount.name }}
# {{- end }}
# {{- end }}

# ----------
{{- define "helm.chartName" -}}
{{- printf "%s" .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "helm.chartVersion" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "helm.labels" -}}
helm.sh/chart: {{ include "helm.chartVersion" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ include "helm.chartName" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

# {{- define "helm.serviceAccountName" -}}
# {{- if .Values.serviceAccount.create }}
# {{- default (include "helm.chartName" .) .Values.serviceAccount.name }}
# {{- else }}
# {{- default "default" .Values.serviceAccount.name }}
# {{- end }}
# {{- end }}
{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "modeld.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "modeld.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create unified labels for modeld components
*/}}
{{- define "modeld.common.matchLabels" -}}
app: {{ template "modeld.name" . }}
release: {{ .Release.Name }}
{{- end -}}

{{- define "modeld.common.metaLabels" -}}
helm.sh/chart: {{ template "modeld.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
{{- end -}}

{{- define "modeld.apiproxy.labels" -}}
{{ include "modeld.apiproxy.matchLabels" . }}
{{ include "modeld.common.metaLabels" . }}
{{- end -}}


{{- define "modeld.apiproxy.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.apiproxy.name | quote }}
{{ include "modeld.common.matchLabels" . }}
{{- end -}}

{{- define "modeld.issuer.labels" -}}
{{ include "modeld.issuer.matchLabels" . }}
{{ include "modeld.common.metaLabels" . }}
{{- end -}}


{{- define "modeld.issuer.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.issuer.name | quote }}
{{ include "modeld.common.matchLabels" . }}
{{- end -}}



{{- define "modeld.apigateway.labels" -}}
{{ include "modeld.apigateway.matchLabels" . }}
{{ include "modeld.common.metaLabels" . }}
{{- end -}}

{{- define "modeld.apigateway.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.apigateway.name | quote }}
{{ include "modeld.common.matchLabels" . }}
{{- end -}}

{{- define "modeld.controlplane.labels" -}}
{{ include "modeld.controlplane.matchLabels" . }}
{{ include "modeld.common.metaLabels" . }}
{{- end -}}

{{- define "modeld.controlplane.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.controlplane.name | quote }}
{{ include "modeld.common.matchLabels" . }}
{{- end -}}

{{- define "modeld.dataplane.labels" -}}
{{ include "modeld.dataplane.matchLabels" . }}
{{ include "modeld.common.metaLabels" . }}
{{- end -}}

{{- define "modeld.dataplane.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.dataplane.name | quote }}
{{ include "modeld.common.matchLabels" . }}
{{- end -}}

{{- define "modeld.datadock.labels" -}}
{{ include "modeld.datadock.matchLabels" . }}
{{ include "modeld.common.metaLabels" . }}
{{- end -}}

{{- define "modeld.datadock.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.datadock.name | quote }}
{{ include "modeld.common.matchLabels" . }}
{{- end -}}

{{- define "modeld.frontend.labels" -}}
{{ include "modeld.frontend.matchLabels" . }}
{{ include "modeld.common.metaLabels" . }}
{{- end -}}

{{- define "modeld.frontend.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.frontend.name | quote }}
{{ include "modeld.common.matchLabels" . }}
{{- end -}}

{{- define "modeld.publisher.labels" -}}
{{ include "modeld.publisher.matchLabels" . }}
{{ include "modeld.common.metaLabels" . }}
{{- end -}}

{{- define "modeld.publisher.matchLabels" -}}
app.kubernetes.io/component: {{ .Values.publisher.name | quote }}
{{ include "modeld.common.matchLabels" . }}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "modeld.fullname" -}}
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
Create a fully qualified apiproxy name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "modeld.apiproxy.fullname" -}}
{{- if .Values.apiproxy.fullnameOverride -}}
{{- .Values.apiproxy.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.apiproxy.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.apiproxy.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Create a fully qualified apigateway name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "modeld.ingress.fullname" -}}
{{- if .Values.apigateway.fullnameOverride -}}
{{- .Values.apigateway.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.apigateway.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.apigateway.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}





{{/*
Create a fully qualified apigateway name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "modeld.apigateway.fullname" -}}
{{- if .Values.apigateway.fullnameOverride -}}
{{- .Values.apigateway.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.apigateway.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.apigateway.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{- define "modeld.issuer.fullname" -}}
{{- if .Values.issuer.fullnameOverride -}}
{{- .Values.issuer.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.issuer.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.issuer.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{- define "modeld.aws.fullname" -}}
{{- if .Values.aws.fullnameOverride -}}
{{- .Values.aws.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.aws.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.aws.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "modeld.servingcert.fullname" -}}
{{- if .Values.servingcert.fullnameOverride -}}
{{- .Values.servingcert.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.servingcert.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.servingcert.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}




{{/*
Create a fully qualified controlplane name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "modeld.controlplane.fullname" -}}
{{- if .Values.controlplane.fullnameOverride -}}
{{- .Values.controlplane.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.controlplane.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.controlplane.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}



{{- define "modeld.dataplane.fullname" -}}
{{- if .Values.dataplane.fullnameOverride -}}
{{- .Values.dataplane.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.dataplane.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.dataplane.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "modeld.datadock.fullname" -}}
{{- if .Values.datadock.fullnameOverride -}}
{{- .Values.datadock.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.datadock.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.datadock.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "modeld.frontend.fullname" -}}
{{- if .Values.frontend.fullnameOverride -}}
{{- .Values.frontend.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.frontend.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.frontend.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}



{{/*
Create a fully qualified publisher name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "modeld.publisher.fullname" -}}
{{- if .Values.publisher.fullnameOverride -}}
{{- .Values.publisher.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.publisher.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.publisher.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Create the name of the service account to use for the apiproxy component
*/}}
{{- define "modeld.serviceAccountName" -}}
    {{- printf "%s-service-account" .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use for the apiproxy component
*/}}
{{- define "modeld.defaultTenantName" -}}
    {{- printf "%s-default-tenant" .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}



{{/*
Return the proper apigateay image name
*/}}
{{- define "apigateway.image" -}}
{{- $registryName := coalesce .Values.global.imageRegistry .Values.apigateway.image.registry -}}
{{- $repositoryName := .Values.apigateway.image.repository -}}
{{- $tag := .Values.apigateway.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{/*
Return the proper api proxy image name
*/}}
{{- define "apiproxy.image" -}}
{{- $registryName := coalesce .Values.global.imageRegistry .Values.apiproxy.image.registry -}}
{{- $repositoryName := .Values.apiproxy.image.repository -}}
{{- $tag := .Values.apiproxy.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}


{{/*
Return the proper api proxy image name
*/}}
{{- define "controlplane.image" -}}
{{- $registryName := coalesce .Values.global.imageRegistry .Values.controlplane.image.registry -}}
{{- $repositoryName := .Values.controlplane.image.repository -}}
{{- $tag := .Values.controlplane.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{/*
Return the proper api proxy image name
*/}}
{{- define "dataplane.image" -}}
{{- $registryName := coalesce .Values.global.imageRegistry .Values.dataplane.image.registry -}}
{{- $repositoryName := .Values.dataplane.image.repository -}}
{{- $tag := .Values.dataplane.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{/*
Return the proper api proxy image name
*/}}
{{- define "datadock.image" -}}
{{- $registryName := coalesce .Values.global.imageRegistry .Values.datadock.image.registry -}}
{{- $repositoryName := .Values.datadock.image.repository -}}
{{- $tag := .Values.datadock.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{/*
Return the proper api proxy image name
*/}}
{{- define "frontend.image" -}}
{{- $registryName := coalesce .Values.global.imageRegistry .Values.frontend.image.registry -}}
{{- $repositoryName := .Values.frontend.image.repository -}}
{{- $tag := .Values.frontend.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{/*
Return the proper api proxy image name
*/}}
{{- define "publisher.image" -}}
{{- $registryName := coalesce .Values.global.imageRegistry .Values.publisher.image.registry -}}
{{- $repositoryName := .Values.publisher.image.repository -}}
{{- $tag := .Values.publisher.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

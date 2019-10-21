{{- /* probes.http defines an http liveness and readiness probes if desired. */ -}}
{{- define "probes.http" -}}
{{- $http := dict "port" .Http.port -}}
{{- if .Values.liveness -}}
  {{- $_ := set $http "path" .Http.livenessPath -}}
  {{- $_ := set $http "delay" .Values.liveness.delay -}}
  {{- $_ := set $http "frequency" .Values.liveness.frequency -}}
  {{- $_ := set $http "failures" .Values.liveness.failures -}}
  {{- $_ := set $http "successes" .Values.liveness.successes -}}
  {{- $_ := set $http "timeout" .Values.liveness.timeout }}
  livenessProbe:
    {{- include "probe.http" $http | indent 4 }}
{{- end -}}
{{- if .Values.readiness -}}
  {{- $_ := set $http "path" .Http.readinessPath -}}
  {{- $_ := set $http "delay" .Values.readiness.delay -}}
  {{- $_ := set $http "frequency" .Values.readiness.frequency -}}
  {{- $_ := set $http "failures" .Values.readiness.failures -}}
  {{- $_ := set $http "successes" .Values.readiness.successes -}}
  {{- $_ := set $http "timeout" .Values.readiness.timeout }}
  readinessProbe:
    {{- include "probe.http" $http | indent 4 }}
{{- end }}
{{- end -}}

{{- /* probe.http defines an http probe for a given url and port. */ -}}
{{- define "probe.http" }}
httpGet:
  path: {{ .path }}
  port: {{ .port }}
initialDelaySeconds: {{ default 5 .delay }}
periodSeconds: {{ default 10 .frequency }}
failureThreshold: {{ default 3 .failures }}
successThreshold: {{ default 1 .successes }}
timeoutSeconds: {{ default 1 .timeout }}
{{- end -}}
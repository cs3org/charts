{{- /* vim: set filetype=mustache: */ -}}
{{- with .Values -}}
{{- $gatewaySvcHost := "0.0.0.0" -}}
{{- $grpcPort := .service.grpc.port -}}

{{- /* Computed defaults for shared section */ -}}
{{- $sharedDefaults := dict "gatewaysvc" (printf "%s:%d" $gatewaySvcHost ($grpcPort | int)) -}}
{{- $_ := set .config "shared" (merge (.config.shared | default $sharedDefaults) $sharedDefaults) -}}
{{- toToml .config -}}

{{- end -}}
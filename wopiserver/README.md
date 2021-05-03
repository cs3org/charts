# WOPISERVER

A Vendor-neutral Web-application Open Platform Interface (WOPI) gateway for EFSS systems.

## Introduction

This chart creates a Wopiserver deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Install

To install the chart with the release name `my-wopi`:

```console
$ helm install my-wopi cs3org/wopiserver
```

## Uninstalling the Chart

To uninstall/delete the deployment:

```console
$ helm delete my-wopi
```

## Configuration

The following configurations may be set. It is recommended to use `values.yaml` for overwriting the wopiserver config.

| Parameter                                         | Description                                                                                         | Default                                                                                                                 |
| ------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `replicaCount`                                    | How many replicas to run.                                                                           | `1`                                                                                                                     |
| `image.repository`                                | Name of the image to run, without the tag.                                                          | [`cs3org/wopiserver`](https://hub.docker.com/r/cs3org/wopiserver)                                                       |
| `image.tag`                                       | The image tag to use.                                                                               | `v6.5.0`                                                                                                                |
| `image.pullPolicy`                                | The kubernetes image pull policy.                                                                   | `Always`                                                                                                                |
| `service.type`                                    | The kubernetes service type to use.                                                                 | `ClusterIP`                                                                                                             |
| `service.port`                                    | The wopiserver service HTTP port.                                                                   | `8880`                                                                                                                  |
| `wopiserverUrl`                                   | Overrides the (default) Helm URL generation based on the ingress/service values.                    | Not set                                                                                                                 |
| `extraVolumeMounts`                               | Array of additional volume mounts.                                                                  | `[]`                                                                                                                    |
| `extraVolumes`                                    | Array of additional volumes.                                                                        | `[]`                                                                                                                    |
| `env`                                             | Additional environment variables passed to the wopiserver container.                                | `[]`                                                                                                                    |
| `config.wopisecret`                               | Wopi-Secret, stored in `/etc/wopi/wopisecret`                                                       | `nil` - generates a random secret (`randAlphaNum 24`)                                                                   |
| `config.iopsecret`                                | IOP-Shared-Secret, stored in `/etc/wopi/iopsecret`                                                  | `nil` - generates a random secret (`randAlphaNum 24`)                                                                   |
| `config.appProviders`                             | Freeform `<app-provider>: <url>` (`oosurl`, `codeurl`, `slidesurl` or `codimdurl` as app-providers) | `{codimdurl: http://codimd.local}`                                                                                      |
| `config.cs3.revahost`                             | The GRPC endpoint of the REVA service.                                                              | `revad:19000`                                                                                                           |
| `config.loglevel`                                 | Logging fequency. Values, in order of severity: `Critical`, `Error`, `Warning`, `Info` `Debug`.     | `Debug`                                                                                                                 |
| `ingress.enabled`                                 | Whether to create an Ingress resource to access the wopiserver.                                     | `false`                                                                                                                 |
| `ingress.hostname`                                | The ingress hostname.                                                                               | `wopi.local`                                                                                                            |
| `ingress.path`                                    | The ingress path.                                                                                   | `/wopi`                                                                                                                 |
| `ingress.annotations`                             | Ingress annotations.                                                                                | `{}`                                                                                                                    |
| `ingress.tls`                                     | Ingress TLS configuration (YAML).                                                                   | `[]`                                                                                                                    |

## WOPI Bridge Configuration

| Parameter                                         | Description                                                                                         | Default                                                                                                                 |
| ------------------------------------------------- | --------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------- |
| `wopibridge.enabled`                              | Wheter to deploy the [WOPI Bridge](https://github.com/cs3org/wopibridge) service.                   | `false`                                                                                                                 |
| `wopibridge.name`                                 | The name used to identify the resources as `{{ wopiserver.fullname }}-{{ .name }}`.                 | `v3.2.0`                                                                                                                |
| `wopibridge.replicaCount`                         | How many replicas to run.                                                                           | `1`                                                                                                                     |
| `wopibridge.image.repository`                     | Name of the image to run, without the tag.                                                          | [`cs3org/wopibridge`](https://hub.docker.com/r/cs3org/wopibridge)                                                       |
| `wopibridge.image.tag`                            | The image tag to use.                                                                               | `latest`                                                                                                                |
| `wopibridge.image.pullPolicy`                     | The kubernetes image pull policy.                                                                   | `Always`                                                                                                                |
| `wopibridge.service.type`                         | The kubernetes service type to use.                                                                 | `ClusterIP`                                                                                                             |
| `wopibridge.service.port`                         | The wopibridge service HTTP port.                                                                   | `8000`                                                                                                                  |
| `wopibridge.bridgeUrl`                            | Overrides the (default) Helm URL generation based on the ingress/service values.                    | Not set                                                                                                                 |
| `wopibridge.extraVolumeMounts`                    | Array of additional volume mounts.                                                                  | `[]`                                                                                                                    |
| `wopibridge.extraVolumes`                         | Array of additional volumes.                                                                        | `[]`                                                                                                                    |
| `wopibridge.env`                                  | Additional environment variables passed to the wopibridge container.                                | `CODIMD_INT_URL: "http://codimd"` and `CODIMD_EXT_URL: https://codimd.local/`                                           |
| `wopibridge.secrets.wbsecret`                     | Wopi-Bridge Secret, stored in `/var/run/secrets/wbsecret`                                           | `nil` - generates a random secret (`randAlphaNum 24`)                                                                   |
| `wopibridge.secrets.codimd_apikey`                | CodiMD Shared Secret, stored in `/var/run/secrets/codimd_apikey`                                    | `nil` - generates a random secret (`randAlphaNum 24`)                                                                   |
| `wopibridge.ingress.enabled`                      | Whether to create an Ingress resource to access the wopibridge.                                     | `false`                                                                                                                 |
| `wopibridge.ingress.hostname`                     | The ingress hostname.                                                                               | `bridge.local`                                                                                                          |
| `wopibridge.ingress.path`                         | The ingress path.                                                                                   | `/wopibridge`                                                                                                           |
| `wopibridge.ingress.annotations`                  | Ingress annotations.                                                                                | `{}`                                                                                                                    |
| `wopibridge.ingress.tls`                          | Ingress TLS configuration (YAML).                                                                   | `[]`                                                                                                                    |

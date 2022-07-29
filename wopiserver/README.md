# WOPISERVER

A Vendor-neutral Web-application Open Platform Interface (WOPI) gateway for EFSS systems.

## Introduction

This chart creates a Wopiserver deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Install

To install the chart with the release name `my-wopi`:

```console
helm install my-wopi cs3org/wopiserver
```

## Uninstalling the Chart

To uninstall/delete the deployment:

```console
helm delete my-wopi
```

## Configuration

The following configurations may be set. It is recommended to use `values.yaml` for overwriting the wopiserver config.

| Parameter                      | Description                                                                              | Default                                                           |
| ------------------------------ | ---------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| `config.cs3.authTokenValidity` | Reva/gRPC authentication token expiration time (seconds).                                | `3600`                                                            |
| `config.cs3.gateway`           | The GRPC endpoint of the REVA gateway service.                                           | `revad:19000`                                                     |
| `config.cs3.sslVerify`         | Enables certificate checking for downloads from the REVA datagateway.                    | `True`                                                            |
| `config.bridge.sslVerify`      | Enables certificate checking for the connected apps.                                     | `True`                                                            |
| `config.detectExternalLocks`   | Enables detection of external Microsoft Office or LibreOffice locks.                     | `False`                                                           |
| `config.loglevel`              | Log level. Values, in order of severity: `Critical`, `Error`, `Warning`, `Info` `Debug`. | `Debug`                                                           |
| `config.token.validity`        | WOPI access token expiration time (seconds).                                             | `86400`                                                           |
| `config.wopi.lock.expiration`  | WOPI lock expiration time (seconds).                                                     | `3600`                                                            |
| `extraResources`               | Extra resources to be included.                                                          | `[]`                                                              |
| `image.pullPolicy`             | The kubernetes image pull policy.                                                        | `IfNotPresent`                                                    |
| `image.repository`             | Name of the image to run, without the tag.                                               | [`cs3org/wopiserver`](https://hub.docker.com/r/cs3org/wopiserver) |
| `image.tag`                    | The image tag to use.                                                                    | `v8.3.2`                                                          |
| `ingress.annotations`          | Ingress annotations.                                                                     | `{}`                                                              |
| `ingress.enabled`              | Whether to create an Ingress resource to access the wopiserver.                          | `false`                                                           |
| `ingress.hostname`             | The ingress hostname.                                                                    | `wopi.local`                                                      |
| `ingress.path`                 | The ingress path.                                                                        | `/wopi`                                                           |
| `ingress.tls`                  | Ingress TLS configuration (YAML).                                                        | `[]`                                                              |
| `replicaCount`                 | How many replicas to run.                                                                | `1`                                                               |
| `resources`                    | Resources to apply to all services.                                                      | `{}`                                                              |
| `secrets.wopiSecret`           | WOPI secret used for signing JWT tokens.                                                 | `nil` - generates a random secret (`randAlphaNum 24`)             |
| `secretsRef`                   | Use an already existing secret instead of configuring the `secrets` settings.            | `nil`                                                             |
| `securityContext.fsGroup`      | File system group for all volumes.                                                       | `1000`                                                            |
| `securityContext.runAsGroup`   | Group ID that all processes within any containers will run with.                         | `1000`                                                            |
| `securityContext.runAsUser`    | User ID that all processes within any containers will run with.                          | `1000`                                                            |
| `service.port`                 | The wopiserver service HTTP port.                                                        | `8880`                                                            |
| `service.type`                 | The Kubernetes service type to use.                                                      | `ClusterIP`                                                       |
| `wopiserverUrl`                | Overrides the (default) Helm URL generation based on the ingress/service values.         | `nil`                                                             |

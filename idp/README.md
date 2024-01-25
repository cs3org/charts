# IDP service

An OpenID Connect Identity Provider service compatible with CS3 APIs based on OCIS IDP implementation.

## Introduction

This chart creates a deployment of [OCIS IDP](https://owncloud.dev/services/idp/) service on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager. The IDP service is configured to use a CS3APIs compliant service (e.g. Reva) as its user info & authentication backend.

## Install

To install the chart with the release name `my-idp`:

```console
helm install my-idp cs3org/idp
```

> **WARNING**: Install command will generate (or overwrite already existing) signing and encryption keys for the IDP, if those are not provided explicitly in the `values.yaml` file.

## Uninstalling the Chart

To uninstall/delete the deployment:

```console
helm delete my-idp
```

## Configuration

The following configurations may be set. It is recommended to use `values.yaml` for overwriting the IDP config.

| Parameter                    | Description                                                                                   | Default                                                   |
| ---------------------------- | --------------------------------------------------------------------------------------------- | --------------------------------------------------------- |
| `log.level`                  | The log level. Valid values are: “panic”, “fatal”, “error”, “warn”, “info”, “debug”, “trace”. | error                                                     |
| `log.color`                  | Activates colorized log output.                                                               | false                                                     |
| `log.pretty`                 | Activates pretty log output.                                                                  | false                                                     |
| `idp.issuerURI`              | External url of the IDP service, used in token issuer field                                   | <http://idp:9130>                                         |
| `idp.accessTokenValidity`    | Expiration time in seconds for IDP access token.                                              | 86400                                                     |
| `idp.idTokenValidity`        | Expiration time in seconds for IDP ID tokens.                                                 | 3600                                                      |
| `idp.refreshTokenValidity`   | Expiration time in seconds for refresh tokens.                                                | 94608000                                                  |
| `idp.clients`                | Registered OpenID Connect clients configuration                                               | `[{name: 'ownCloud desktop app', ...}]`                   |
| `cs3.gateway`                | CS3 gateway used to authenticate and look up users                                            | revad:19000                                               |
| `extraResources`             | Extra resources to be included.                                                               | `[]`                                                      |
| `image.pullPolicy`           | The kubernetes image pull policy.                                                             | `IfNotPresent`                                            |
| `image.repository`           | Name of the image to run, without the tag.                                                    | [`owncloud/ocis`](https://hub.docker.com/r/owncloud/ocis) |
| `image.tag`                  | The image tag to use.                                                                         | `v8.3.2`                                                  |
| `ingress.annotations`        | Ingress annotations.                                                                          | `{}`                                                      |
| `ingress.enabled`            | Whether to create an Ingress resource to access the wopiserver.                               | `false`                                                   |
| `ingress.hostname`           | The ingress hostname.                                                                         | `idp.local`                                               |
| `ingress.path`               | The ingress path.                                                                             | `/`                                                       |
| `ingress.tls`                | Ingress TLS configuration (YAML).                                                             | `[]`                                                      |
| `replicaCount`               | How many replicas to run.                                                                     | `1`                                                       |
| `resources`                  | Resources to apply to all services.                                                           | `{}`                                                      |
| `secretsRef`                 | Use an already existing secret instead of configuring the `secrets` settings.                 | `nil`                                                     |
| `securityContext.fsGroup`    | File system group for all volumes.                                                            | `1000`                                                    |
| `securityContext.runAsGroup` | Group ID that all processes within any containers will run with.                              | `1000`                                                    |
| `securityContext.runAsUser`  | User ID that all processes within any containers will run with.                               | `1000`                                                    |
| `service.port`               | The wopiserver service HTTP port.                                                             | `8880`                                                    |
| `service.type`               | The Kubernetes service type to use.                                                           | `ClusterIP`                                               |

> **NOTE**: This service requires atlest one `idp.clients` to be registered in order to boot properly.

## Register with Sciencemesh Proxy IDP portal

Before your IDP service can appear in the Sciencemesh [Proxy IDP portal](http://aai-demo.sciencemesh.cesnet.cz/.well-known/openid-configuration), you will need to register it by contacting CESNET administrators with your `idp.issuerURL` and to register Proxy IDP portal client in your `idp.clients` config.

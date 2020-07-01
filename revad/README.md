# REVA

Reva is an open source platform with two purposes:

- To be an interoperability middleware to [link platforms with the storage and application providers](https://reva.link/docs/overview/).
- To serve as the reference implementation of the [CS3APIS](https://github.com/cs3org/cs3apis).

## Introduction

This chart creates a Reva deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Install

To install the chart with the release name `my-reva`:

```console
$ helm install my-reva cs3org/revad
```

## Uninstalling the Chart

To uninstall/delete the deployment:

```console
$ helm delete my-reva
```

## Configuration

The following configurations may be set. It is recommended to use `values.yaml` for overwriting the revad config.

| Parameter                                         | Description                                                                                      | Default                                                                                                                 |
| ------------------------------------------------- | ------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- |
| `replicaCount`                                    | How many replicas to run.                                                                        | `1`                                                                                                                     |
| `image.repository`                                | Name of the image to run, without the tag.                                                       | [`cs3org/revad`](https://hub.docker.com/r/cs3org/revad)                                                                 |
| `image.tag`                                       | The image tag to use.                                                                            | `latest`                                                                                                                |
| `image.pullPolicy`                                | The kubernetes image pull policy.                                                                | `Always`                                                                                                                |
| `service.type`                                    | The kubernetes service type to use.                                                              | `ClusterIP`                                                                                                             |
| `service.grpc.port`                               | Revad's GRPC Service port. To be set on the `address` under the `[grpc]` section of the config.  | `19000`                                                                                                                 |
| `service.http.port`                               | Revad's HTTP Service port. To be set on the `address` under the `[http]` section of the config.  | `19001`                                                                                                                 |
| `configFiles.revad\.toml`                         | Revad [config file](https://reva.link/docs/config/). Mounted on `/etc/revad/`.                   | [`examples/standalone/standalone.toml`](https://github.com/cs3org/reva/blob/master/examples/standalone/standalone.toml) |
| `configFiles.users\.json`                         | Revad `users.json` for the `auth_manager` and `userprovider` services. Mounted on `/etc/revad/`. | [`examples/standalone/users.demo.json`](https://github.com/cs3org/reva/blob/master/examples/standalone/users.demo.json) |
| `extraVolumeMounts` | Array of additional volume mounts | `[]` |
| `extraVolumes` | Array of additional volumes | `[]` |

### Deploying REVA with a `custom-config.toml` file

```console
$ helm install custom-reva cs3org/revad \
  --set-file configFiles.revad\.toml=custom-config.toml
```

# CS3ORG Chart Repo

Kubernetes Charts Repository for CS3ORG

This reposity contains the official charts for CS3Org software, like Reva.

The chart repository is available at [https://cs3org.github.io/charts](https://cs3org.github.io/charts).

## Working with this repo

Add the chart repo:

```bash
$ helm repo add cs3org https://cs3org.github.io/charts/
"cs3org" has been added to your repositories
```

Verify it's available and searh for charts:

```bash
$ helm repo list
NAME  	URL
cs3org	https://cs3org.github.io/charts/

$ helm search repo cs3org
NAME        	CHART VERSION	APP VERSION	DESCRIPTION
cs3org/revad	0.1.6        	0.1.0      	The Reva daemon (revad) helm chart
```

## Examples

### Deploying REVA with custom config

```console
$ cat << EOF > custom-values.yaml
service:
  http:
    port: 20001
configFiles:
  revad.toml: |
    [http]
    address = "0.0.0.0:20001"

    [http.services.helloworld]
EOF

$ helm install custom-reva cs3org/revad -f custom-values.yaml
```
or

```console
$ helm install custom-reva cs3org/revad \
  --set service.http.port=20001 \
  --set-file configFiles.revad\\.toml=custom-config.toml
```

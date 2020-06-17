# CS3ORG Chart Repo

Kubernetes Charts Repository for CS3ORG

This reposity contains the official charts for CS3Org software, like Reva.

The chart repository is available at [cs3org.github.io/charts](cs3org.github.io/charts).

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
cs3org/revad	0.1.0        	0.1.0      	The Reva daemon (revad) helm chart
```

## Examples

### Running REVAD as dataprovider

```console
$ cat << EOF > storage-oc.yaml
service:
  grpc:
    port: 11000
  http:
    port: 11001
configFiles:
  revad.toml: |
    [grpc]
    address = "0.0.0.0:11000"

    [grpc.services.storageprovider]
    driver = "owncloud"
    mount_path = "/oc"
    mount_id = "a71054f7-947f-4709-9992-2ad62fe24fa4"
    expose_data_server = true
    data_server_url = "http://localhost:11001/data"

    [grpc.services.storageprovider.drivers.owncloud]
    datadirectory = "/var/tmp/reva/data"

    [http]
    address = "0.0.0.0:11001"

    [http.services.dataprovider]
    driver = "owncloud"
    temp_folder = "/var/tmp/reva/tmp"

    [http.services.dataprovider.drivers.owncloud]
    datadirectory = "/var/tmp/reva/data"
EOF

$ helm install dataprovider cs3org/revad -f storage-oc.yaml
```
or

```console
$ helm install dataprovider cs3org/revad \
  --set service.grpc.port=11000 \
  --set service.http.port=11001 \
  --set-file configFiles.revad.toml=storage-oc.toml
```

Thanks to @mirekys for the contribution!

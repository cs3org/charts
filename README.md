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

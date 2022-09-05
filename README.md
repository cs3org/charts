# CS3ORG Chart Repo

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) ![Release Charts](https://github.com/cs3org/charts/workflows/Release%20Charts/badge.svg) [![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/cs3org)](https://artifacthub.io/packages/search?repo=cs3org)

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
cs3org/revad	1.2.1        	v1.2.0     	The Reva daemon (revad) helm chart
```

Github chart repository: https://github.com/cs3org/charts


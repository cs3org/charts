### Contributing a Chart / update to an existing Chart

- [ ] Run `helm lint` on the chart dir.
- [ ] (Update) Bump the `Chart.yaml` version before merging, to release it as a new version.
- [ ] (Update) Replace the `annotations` on the `Chart.yaml` with:
  - `artifacthub.io/changes` - the changes introduced on the PR [with the appropiate format](https://artifacthub.io/docs/topics/annotations/helm/#supported-annotations).
  - `artifacthub.io/images` - the updated tag on the `cs3org/revad` image.
- [ ] (Update) If the PR includes new configurable parameters in the chart's `values.yaml`. Add documentation in the appropiate README.

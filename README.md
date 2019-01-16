# Terraform Kubernetes Engine Module

This module handles opinionated Google Cloud Platform Kubernetes Engine control
plane only with it's required networking resources.

The resources that this module will create/trigger are:

1. Create a GKE cluster with the provided addons

### Using this module

In order to use this module, include it and override any variables defined [here](variables.tf) that you want.
[Here's an example of a basic usage](examples/gke-test.tf) (assuming all default's set in variables.tf)

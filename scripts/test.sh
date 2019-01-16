#!/bin/bash
set -euf -o pipefail

cd examples
	terraform apply "plan"
cd ../scripts

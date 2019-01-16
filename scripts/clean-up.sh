#!/bin/bash
set -euf -o pipefail

declare -a files=(
	"examples/terraform.tfstate"
	"examples/terraform.tfstate.backup"
	"examples/.terraform.tfstate.lock.info"
	)

cd examples \
	&& terraform destroy \
		-auto-approve \
&& cd ..

cd examples
	rm -rfv .terraform
	for file in "${files[@]}"; do
		rm -rfv $file
	done
cd ../scripts

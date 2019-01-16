#!/bin/bash
set -euf -o pipefail

cd examples \
		&& terraform init \
		&& terraform plan \
		  -out=plan\
&& cd ../scripts

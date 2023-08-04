
init:
	@if [ -z $(TF_VAR_env) ]; then echo '$$env is empty'; exit 1; else echo "Configuring backend for $(TF_VAR_env)"; fi
	@make remove-local-state
	@terraform init \
	-backend-config="bucket=hello-world-tf-state-${TF_VAR_env}" \
	-backend-config="key=hello-world-iac" \
	-backend-config="region=${AWS_REGION}" 

remove-local-state:
	@rm -f .terraform/terraform.tfstate

plan:
	@if [ ${TF_VAR_env} !=  "$(shell cat .terraform/terraform.tfstate  | jq -r  '.backend.config.bucket' | cut -d "-" -f 5)" ]; then echo "Error: Please re-initialize backend."; exit 1; fi
	@terraform plan -out tf.plan

apply:
	@terraform apply tf.plan

show-tf-backend:
	@cat .terraform/terraform.tfstate  | jq  '.backend.config.bucket' || echo "Not initialized"


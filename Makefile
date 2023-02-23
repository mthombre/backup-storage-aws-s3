plan:
	terraform init
	terraform plan

deploy:
	terraform apply --auto-approve

destroy:
	terraform destroy
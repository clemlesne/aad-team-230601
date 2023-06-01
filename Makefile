.PHONY: test lint

test:
	@echo "➡️ Running Prettier..."
	npx --yes prettier@2.8.8 --editorconfig --check .

	@echo "➡️ Running Terraform..."
	terraform fmt -check

	@echo "➡️ Running Hadolint..."
	find . -name "Dockerfile*" -exec bash -c "echo 'File {}:' && hadolint {}" \;

lint:
	@echo "➡️ Running Prettier..."
	npx --yes prettier@2.8.8 --editorconfig --write .

	@echo "➡️ Running Terraform..."
	terraform fmt

	@echo "➡️ Running Hadolint..."
	find . -name "Dockerfile*" -exec bash -c "echo 'File {}:' && hadolint {}" \;

TF_DIRS = $(shell find . -not -path '*/\.terragrunt-cache/*' -type f -name "*.tf" -exec dirname {} \;|sort -u)

default: fmt

.PHONY: fmt
fmt:
	@for m in $(TF_DIRS); do (terraform fmt -diff "$$m" && echo "√ $$m"); done

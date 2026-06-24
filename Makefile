.PHONY: all install help

# colors for terminal output
COLOR_RESET   = \033[0m
COLOR_INFO    = \033[32m
COLOR_WARNING = \033[33m
COLOR_TITLE   = \033[1;34m

# default target
.DEFAULT_GOAL := help

help: ## show this help message
	@echo "$(COLOR_TITLE)==================================$(COLOR_RESET)"
	@echo "$(COLOR_TITLE)       Git Config Makefile        $(COLOR_RESET)"
	@echo "$(COLOR_TITLE)==================================$(COLOR_RESET)"
	@echo "Available targets:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## run global git configuration script
	@echo "$(COLOR_INFO)➜ Running global git configuration...$(COLOR_RESET)"
	bash git-cli/gitconfig_global.sh
	@echo "$(COLOR_INFO)✔ Git config installation done.$(COLOR_RESET)"

all: install ## install configuration and copy .gitmessage / .gitexcludes to home directory
	@echo "$(COLOR_INFO)➜ Copying .gitmessage to ~/$(COLOR_RESET)"
	cp .gitmessage ~/
	@echo "$(COLOR_INFO)➜ Copying .gitexcludes to ~/$(COLOR_RESET)"
	cp .gitexcludes ~/
	@echo "$(COLOR_INFO)✔ All setup complete.$(COLOR_RESET)"

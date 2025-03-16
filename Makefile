.DEFAULT_GOAL := help
MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
DOTFILES_DIR := $(dir $(MAKEFILE_PATH))

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

ln:
	@ln -snvf $(DOTFILES_DIR)home/.??* $(HOME)
	@mkdir -p $(HOME)/.config
	@ln -snvf $(DOTFILES_DIR)config/* $(HOME)/.config
	@ln -snvf $(HOME)/.config/zsh/.zshrc $(HOME)/.zshrc
	@echo "Created symbolic links."

dir:
	@echo $(MAKEFILE_PATH)
	@echo $(DOTFILES_DIR)
	@echo $(HOME)
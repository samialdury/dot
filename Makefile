.DEFAULT_GOAL := help

VSCODE_CONFIG_DIR = ~/Library/Application\ Support/Code/User

##@ Misc

.PHONY: help
help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Configuration

.PHONY: link
link:
	ln -sf $(PWD)/.config ~/.config
	ln -sf $(PWD)/.gitconfig-global ~/.gitconfig
# VSCode
	ln -sf $(PWD)/.config/vscode/settings.json $(VSCODE_CONFIG_DIR)/settings.json
	ln -sf $(PWD)/.config/vscode/keybindings.json $(VSCODE_CONFIG_DIR)/keybindings.json
	ln -sf $(PWD)/.config/vscode/snippets $(VSCODE_CONFIG_DIR)/snippets

.PHONY: clean
clean: ## Clean up
	rm -rf ~/.config
	rm -f ~/.gitconfig
# VSCode
	rm -f $(VSCODE_CONFIG_DIR)/settings.json
	rm -f $(VSCODE_CONFIG_DIR)/keybindings.json
	rm -f $(VSCODE_CONFIG_DIR)/snippets

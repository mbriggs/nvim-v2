clone:
	git clone https://github.com/AstroNvim/AstroNvim.git $$HOME/.config/nvim

clean:
	rm -rf $$HOME/.cache/nvim
	rm -rf $$HOME/.local/share/nvim
	rm -rf $$HOME/.local/state/nvim
	rm -rf $$HOME/.config/nvim

dependencies:
	brew install rust || exit 1
	brew install borkdude/brew/clj-kondo || exit 1
	brew install --cask cljstyle || exit 1
	brew install ripgrep || exit 1
	brew install codespell || exit 1
	brew install shfmt || exit 1
	brew install sqlparse || exit 1
	brew install shellcheck || exit 1
	brew install stylua || exit 1
	brew install hadolint || exit 1
	pip3 install cmakelang || exit 1
	npm install -g prettier || exit 1
	npm install -g lua-fmt || exit 1
	npm install -g eslint_d || exit 1
	npm install -g @fsouza/prettierd || exit 1
	npm install -g @unibeautify/beautifier-sqlformat || exit 1
	npm install -g stylelint || exit 1
	gem install rubocop rubocop-rails || exit 1

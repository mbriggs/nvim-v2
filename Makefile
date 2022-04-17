clone:
	git clone https://github.com/AstroNvim/AstroNvim.git $$HOME/.config/nvim

link:
	ln -s $$HOME/nvim $$HOME/.config/nvim/lua/user

clean:
	rm -rf $$HOME/.cache/nvim
	rm -rf $$HOME/.local/share/nvim
	rm -rf $$HOME/.local/share/lunarvim
	rm -rf $$HOME/.config/nvim

install: clean clone link

dependencies:
	brew install ripgrep
	brew install nnn
	brew install codespell
	brew install shfmt
	brew install sqlparse
	brew install shellcheck
	brew install stylua
	brew install hadolint
	pip3 install cmakelang
	npm i -g prettier
	npm i -g lua-fmt
	npm i -g eslint_d
	npm install -g @fsouza/prettierd
	npm install -g @unibeautify/beautifier-sqlformat
	npm install -g stylelint
	gem install rubocop rubocop-rails

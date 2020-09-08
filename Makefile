main-group=git tmux zsh vim nvim
optional-group=i3 fonts nvm rbenv

XDG_CONFIG_HOME ?= $(HOME)/.config

install: ${main-group}

clean: git-clean tmux-clean zsh-clean vim-clean fonts-clean nvm-clean

.PHONY: ${main-group} ${optional-group}

tmux:
	ln -sf `pwd`/tmux/tmux.conf ~/.tmux.conf

tmux-clean:
	rm -f ~/.tmux.conf

git:
	ln -sf `pwd`/git/gitconfig ~/.gitconfig
	echo "Add your Git username and email in ~/.gitconfig.local"

git-clean:
	rm ~/.gitconfig

vim:
	mkdir -p ~/.vim
	ln -sf `pwd`/vim/after ~/.vim/after
	ln -sf `pwd`/vim/functions.vim ~/.vim/functions.vim
	ln -sf `pwd`/vim/plugins.vim ~/.vim/plugins.vim
	ln -sf `pwd`/vim/vimrc ~/.vim/vimrc
	vim +PlugInstall +qall -u ~/.vim/plugins.vim

vim-clean:
	rm -Rf ~/.vim/after
	rm -Rf ~/.vim/functions.vim
	rm -Rf ~/.vim/plugins.vim
	rm -Rf ~/.vim/vimrc

nvim:
	ln -sf `pwd`/nvim $(XDG_CONFIG_HOME)/nvim
	nvim +PlugInstall +qall -u $(XDG_CONFIG_HOME)/nvim/plugins.vim

nvim-clean:
	rm -rf $(XDG_CONFIG_HOME)/nvim

zsh:
	`pwd`/git-clone-pull 'https://github.com/sorin-ionescu/prezto/' ~/.zprezto
	`pwd`/zsh/install-prezto-conf
	ln -sfn `pwd`/zsh/zsh ~/.zsh
	ln -sf `pwd`/zsh/zshrc ~/.zshrc
	ln -sf `pwd`/zsh/zpreztorc ~/.zpreztorc
	ln -sf `pwd`/zsh/prompt_mark_setup ~/.zprezto/modules/prompt/functions/prompt_mark_setup

zsh-clean:
	rm -Rf ~/.zpreztorc
	rm -Rf ~/.zshrc
	`pwd`/zsh/remove-prezto-conf
	rm -Rf ~/.zprezto

# Optional items that are not installed by default.

fonts:
	`pwd`/get-nerd-fonts ~/.local/share/fonts/nerd-fonts
	fc-cache

fonts-clean:
	rm -Rf ~/.local/share/fonts/nerd-fonts
	fc-cache

i3:
	ln -sf `pwd`/i3 $(XDG_CONFIG_HOME)/i3

i3-clean:
	rm -Rf $(XDG_CONFIG_HOME)/i3

nvm:
	`pwd`/git-clone-pull 'https://github.com/creationix/nvm' ~/.nvm
	git -C ~/.nvm checkout `git -C ~/.nvm describe --abbrev=0 --tags`

nvm-clean:
	rm -Rf ~/.nvm

rbenv:
	`pwd`/git-clone-pull 'https://github.com/rbenv/rbenv.git' ~/.rbenv
	`pwd`/git-clone-pull 'https://github.com/rbenv/ruby-build.git' ~/.rbenv/plugins/ruby-build

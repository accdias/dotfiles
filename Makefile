default:

symlinks:
	ln -sf ${HOME}/dotfiles/bash_profile ${HOME}/.bash_profile
	ln -sf ${HOME}/dotfiles/bashrc ${HOME}/.bashrc
	ln -sf ${HOME}/dotfiles/bashrc.d ${HOME}/bashrc.d
	ln -sf ${HOME}/dotfiles/gitconfig ${HOME}/.gitconfig
	ln -sf ${HOME}/dotfiles/inputrc ${HOME}/.inputrc
	ln -sf ${HOME}/dotfiles/minttyrc ${HOME}/.minttyrc
	ln -sf ${HOME}/dotfiles/screenrc ${HOME}/.screenrc
	ln -sf ${HOME}/dotfiles/vim ${HOME}/.vim
	ln -sf ${HOME}/dotfiles/vimrc ${HOME}/.vimrc
	ln -sf /cygdrive/c/Users/accdias/Desktop ${HOME}/Desktop
	ln -sf /cygdrive/c/Users/accdias/Downloads ${HOME}/Downloads
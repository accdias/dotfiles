## My dotfiles collection

This is my dotfiles collection, a set of configuration files I use to customize tools used on a daily basis.

### License

These files are licensed under [Artistic License 2.0](LICENSE.txt)

### How do I use these files?

```sh
mkdir ~/git
cd ~/git
git clone https://github.com/accdias/dotfiles
cd ~
ln -sf ~/git/dotfiles/bash_profile ~/.bash_profile
ln -sf ~/git/dotfiles/bashrc ~/.bashrc
ln -sf ~/git/dotfiles/bashrc.d ~/.bashrc.d
ln -sf ~/git/dotfiles/elinks/elinks.conf ~/.elinks/elinks.conf
ln -sf ~/git/dotfiles/fonts.conf ~/.fonts.conf
ln -sf ~/git/dotfiles/fonts ~/.local/share/fonts
ln -sf ~/git/dotfiles/gitconfig ~/.gitconfig
ln -sf ~/git/dotfiles/inputrc ~/.inputrc
ln -sf ~/git/dotfiles/screenrc ~/.screenrc
ln -sf ~/git/dotfiles/taskrc ~/.taskrc
ln -sf ~/git/dotfiles/themes ~/.local/share/themes
ln -sf ~/git/dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/git/dotfiles/vim ~/.vim
ln -sf ~/git/dotfiles/XCompose ~/.XCompose
ln -sf ~/git/dotfiles/Xresources ~/.Xresources
ln -sf ~/git/dotfiles/xsession ~/.xsession
ln -sf ~/git/dotfiles/zim ~/.config/zim
```
### Help

#### tmux

##### Keybindings

|Key combination                              |Action                 |
|---------------------------------------------|-----------------------|
|<kbd>Ctrl</kbd><kbd>a</kbd> 	              |Command                |
|<kbd>Command</kbd><kbd>t</kbd>               |New window             |
|<kbd>Command</kbd><kbd>w</kbd>               |Kill pane              |
|<kbd>Command</kbd><kbd>q</kbd>               |Kill session           |
|<kbd>Command</kbd><kbd>r</kbd>               |Reload tmux config     |
|<kbd>Command</kbd><kbd>z</kbd>               |Zoom to pane           |
|<kbd>Command</kbd><kbd>$</kbd>               |Rename session         |
|<kbd>Command</kbd><kbd>,</kbd>               |Rename window          |
|<kbd>Command</kbd><kbd>g</kbd>               |Split vertically       |
|<kbd>Command</kbd><kbd>h</kbd>               |Split horizontally     |
|<kbd>Command</kbd><kbd>?</kbd>               |List keyboard shortcuts|
|<kbd>Command</kbd><kbd>:</kbd>               |Command prompt         |
|<kbd>Command</kbd><kbd>s</kbd>               |List sessions          |
|<kbd>Command</kbd><kbd>r</kbd>               |Reload session         |
|<kbd>Command</kbd><kbd>Ctrl</kbd><kbd>s</kbd>|Save session           |

##### Selecting, Copying and Pasting

* Enter scroll mode with the mouse wheel.
* Select the text and press <kbd>y</kbd>.
* This copies the text into the clipboard.
* Exit scroll mode with <kbd>ESC</kbd>.

##### Advanced copy:

* Enter scroll mode with the mouse wheel.
* Select the text and press <kbd>Y</kbd>.
* This copies the text into the terminal buffer and the clipboard.
* Exit scroll mode with <kbd>ESC</kbd>.

### Credits

#### tmux.conf

* Kudos to [Peter Forgacs](http://peterforgacs.github.io) for his
[tmux.conf article](http://peterforgacs.github.io/2017/04/25/Tmux/)
from where I borrowed some tweaks and the idea for a help on the keybindings.

#### screenrc

* Kudos to [Sven Guckes](http://www.guckes.net) for his
[screenrc](http://www.guckes.net/Setup/screenrc) file.

### vimrc

* Kudos to the nicest and smartest vim community at
[/r/vim](https://www.reddit.com/r/vim) for tips about
tuning, readbility and vimscript.

### Gnome Terminal

* Kudos to [Mayccoll](https://github.com/Mayccoll) and his [Gnome Terminal color schemes](https://github.com/Mayccoll/Gogh/blob/master/content/themes.md)

